//Bibliotecas:
#include <SPI.h>
#include <MFRC522.h>

//Pinos:
#define SS_PIN 10
#define RST_PIN 9
#define LED 7
#define BOTAO 6
#define BOTAO_RST 5

//Objeto rfid:
MFRC522 rfid(SS_PIN, RST_PIN);

//chave (key) de autenticaçao do cartão:
MFRC522::MIFARE_Key key;


// São duas mensagens/códigos que podem ser gravados no cartão
// A primeira "ARDUINO_002     " é usada para o começo da sessão e vai resultar em "acesso negado" para a liberação da trava da atividade
// A segunda "ARDUINO_001     " libera a trava
// A principal adaptação necessária é substituir BOTAO por um mecanismo de sinalização de software com o fim do minijogo
// BOTAO_RST é importante para permitir que a atividade seja configurada para a sessão

void setup() {

  // Começo/inicialização da comunicação serial, SPI e do módulo rfid
  Serial.begin(9600);
  SPI.begin();
  rfid.PCD_Init();

  //Configuração dos pinos
  pinMode(LED, OUTPUT);
  pinMode(BOTAO, INPUT_PULLUP);       // Botão ligado ao GND
  pinMode(BOTAO_RST, INPUT_PULLUP);   // Botão RESET ligado ao GND

  digitalWrite(LED, LOW);

  Serial.println("Sistema pronto.");
  Serial.println("BOTAO = gravacao normal");
  Serial.println("BOTAO_RST = gravacao ARDUINO_002");

  // Chave padrão (0x) FF FF FF FF FF FF
  for (byte i = 0; i < 6; i++) {
    key.keyByte[i] = 0xFF;
  }
}

void loop() {
  
  //Aguarda o botão ser pressionado 
  if (digitalRead(BOTAO_RST) == LOW) {

    Serial.println("BOTAO_RST acionado!");
    Serial.println("Modo especial: aproxime o cartao.");

    // LED acende
    digitalWrite(LED, HIGH);

    // Aguarda o cartão
    while (!rfid.PICC_IsNewCardPresent()) {
      delay(50);
    }

    // Aguarda a leitura do cartão
    while (!rfid.PICC_ReadCardSerial()) {
      delay(50);
    }

    // Bloco 4 do mifare
    byte bloco = 4;

    // Mensagem que vai ser gravada no cartão
    byte dados[16] = {
      'A','R','D','U','I','N','O',
      '_',
      '0','0','2',
      ' ',
      ' ',
      ' ',
      ' ',
      ' '
    };

    // status da gravação
    MFRC522::StatusCode status;

    // Autenticação
    status = rfid.PCD_Authenticate(
        MFRC522::PICC_CMD_MF_AUTH_KEY_A,
        bloco,
        &key,
        &(rfid.uid));

    // Confere se a autenticação ocorreu
    if (status != MFRC522::STATUS_OK) {

      Serial.print("Erro de autenticacao: ");
      Serial.println(rfid.GetStatusCodeName(status));

      digitalWrite(LED, LOW);

    } else {

      // Grava a mensagem
      status = rfid.MIFARE_Write(bloco, dados, 16);

      if (status == MFRC522::STATUS_OK) {

        Serial.println("ARDUINO_002 gravado com sucesso!");
        digitalWrite(LED, LOW);

      } else {

        Serial.print("Erro na gravacao: ");
        Serial.println(rfid.GetStatusCodeName(status));

        digitalWrite(LED, LOW);
      }
    }

    // Fim da comunicação
    rfid.PICC_HaltA();
    rfid.PCD_StopCrypto1();

    // Aguarda o BOTAO_RST ser solto
    while (digitalRead(BOTAO_RST) == LOW) {
      delay(50);
    }

    delay(300);

    // Volta para o funcionamento normal
    return;
  }

  // Aguarda o botão ser pressionado
  while (digitalRead(BOTAO) == HIGH) {

    // Durante a espera, verifica também o BOTAO_RST
    if (digitalRead(BOTAO_RST) == LOW) {
      return;
    }

    digitalWrite(LED, LOW);
  }

  Serial.println("Gravacao liberada! Aproxime o cartao.");

  // Aguarda o cartão
  while (!rfid.PICC_IsNewCardPresent()) {

    // Se BOTAO_RST for pressionado durante a espera, abandona a operação normal e volta
    if (digitalRead(BOTAO_RST) == LOW) {
      digitalWrite(LED, LOW);
      return;
    }

    digitalWrite(LED, HIGH);
    delay(250);
    digitalWrite(LED, LOW);
    delay(250);
  }

  //Processo análogo ao anterior:
  while (!rfid.PICC_ReadCardSerial());

  byte bloco = 4;

  byte dados[16] = {
    'A','R','D','U','I','N','O',
    '_',
    '0','0','1',
    ' ',
    ' ',
    ' ',
    ' ',
    ' '
  };

  MFRC522::StatusCode status;

  status = rfid.PCD_Authenticate(
      MFRC522::PICC_CMD_MF_AUTH_KEY_A,
      bloco,
      &key,
      &(rfid.uid));

  if (status != MFRC522::STATUS_OK) {

    Serial.print("Erro de autenticacao: ");
    Serial.println(rfid.GetStatusCodeName(status));

    digitalWrite(LED, LOW);
    return;
  }

  status = rfid.MIFARE_Write(bloco, dados, 16);

  if (status == MFRC522::STATUS_OK) {

    Serial.println("Dados gravados com sucesso!");

    // Para de piscar e mantém o LED aceso
    digitalWrite(LED, HIGH);
    delay(3000);

  } else {

    Serial.print("Erro na gravacao: ");
    Serial.println(rfid.GetStatusCodeName(status));

    digitalWrite(LED, LOW);
  }

  rfid.PICC_HaltA();
  rfid.PCD_StopCrypto1();

  while (digitalRead(BOTAO) == LOW);

  delay(300);
}
