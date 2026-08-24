// Bibliotecas:
#include <SPI.h>
#include <MFRC522.h>
#include <Servo.h>
#include <string.h>

// Define pinos:
// Slave para comunicação SPI: 53
#define SS_PIN 53
// Reset: 5
#define RST_PIN 5
// LED: 7
#define LED 7

MFRC522 rfid(SS_PIN, RST_PIN);
Servo trava;

// Armazenamento dos códigos permitidos
byte cartaoAutorizado[] = {0x9F, 0xFA, 0xAD, 0xA9};
byte cartaoReset[] = {0xDA, 0x8A, 0xAD, 0xA9};

const char mensagemEsperada[] = "ARDUINO_001     ";

bool aguardandoSegundoCartao = false;

void setup()
{
    Serial.begin(9600);

    SPI.begin();
    rfid.PCD_Init();

    // Servo começa parado
    trava.attach(8);
    trava.write(90);

    pinMode(LED, OUTPUT);

    Serial.println("Aproxime o primeiro cartao...");
}

void loop()
{
    
    // Espera pelo cartao de liberação da trava
    if (!aguardandoSegundoCartao)
    {
        if (!rfid.PICC_IsNewCardPresent())
            return;

        if (!rfid.PICC_ReadCardSerial())
            return;

        mostrarUID();

        // Se for o cartao certo, com a mensagem gravada, libera a trava
        if (cartaoValido() && mensagemValida())
        {
            Serial.println("Primeiro cartao valido!");
            Serial.println("Liberando trava...");

            trava.write(0);
            delay(400);
            trava.write(90);

            aguardandoSegundoCartao = true;

            Serial.println("Aproxime o segundo cartao...");
        }

        // Se não, pisca o led
        else
        {
            Serial.println("Cartao ou mensagem invalida.");

            for (int i = 0; i < 5; i++)
            {
                digitalWrite(LED, HIGH);
                delay(200);
                digitalWrite(LED, LOW);
                delay(200);
            }

            trava.write(90);
        }

        // Encerra a leitura do cartão
        rfid.PICC_HaltA();
        rfid.PCD_StopCrypto1();
        
        delay(500);

        return;
    }


    // Agurada um segundo cartão para trancar novamente (configuração pré/pós sessão)
    if (aguardandoSegundoCartao)
    {
        Serial.println("Esperando segundo cartao...");

        if (!rfid.PICC_IsNewCardPresent())
            return;

        if (!rfid.PICC_ReadCardSerial())
            return;

        mostrarUID();

        // Para o cartão de reset, tranca
        if (cartaoRst())
        {
            Serial.println("Segundo cartao valido!");
            Serial.println("Fechando trava...");

            trava.write(180);
            delay(400);
            trava.write(90);

            delay(500);
            aguardandoSegundoCartao = false;

            Serial.println("Trava fechada.");
            Serial.println("Aproxime o primeiro cartao...");
        }
        else
        {
            Serial.println("Segundo cartao invalido.");

            // Pisca o LED
            for (int i = 0; i < 5; i++)
            {
                digitalWrite(LED, HIGH);
                delay(200);
                digitalWrite(LED, LOW);
                delay(200);
            }

            Serial.println("Continue aproximando um cartao valido.");
        }

        rfid.PICC_HaltA();
        rfid.PCD_StopCrypto1();

        delay(500);
    }
}


// Print do código
void mostrarUID()
{
    Serial.print("UID: ");

    for (byte i = 0; i < rfid.uid.size; i++)
    {
        Serial.print(rfid.uid.uidByte[i], HEX);
        Serial.print(" ");
    }

    Serial.println();
}


// Verifica se é o cartão de liberação da trava
bool cartaoValido()
{
    // Confirma se tem 4 bytes
    if (rfid.uid.size != 4)
        return false;

    // Confirma se é o código correto
    for (byte i = 0; i < 4; i++)
    {
        if (rfid.uid.uidByte[i] != cartaoAutorizado[i])
            return false;
    }

    return true;
}

// Verifica se é o cartaõ de reset
bool cartaoRst()
{
    // Confirma se tem 4 bytes
    if (rfid.uid.size != 4)
        return false;

    // Confirma se é o código correto
    for (byte i = 0; i < 4; i++)
    {
        if (rfid.uid.uidByte[i] != cartaoReset[i])
            return false;
    }

    return true;
}

// Verifica se a mensagem correta foi gravada anteriormente
bool mensagemValida()
{
    MFRC522::MIFARE_Key key;

    // Chave padrão:
    for (byte i = 0; i < 6; i++)
        key.keyByte[i] = 0xFF;

    byte bloco = 4;
    byte buffer[18];
    byte tamanho = sizeof(buffer);

    MFRC522::StatusCode status;

    status = rfid.PCD_Authenticate(
        MFRC522::PICC_CMD_MF_AUTH_KEY_A,
        bloco,
        &key,
        &(rfid.uid)
    );

    if (status != MFRC522::STATUS_OK)
        return false;

    status = rfid.MIFARE_Read(bloco, buffer, &tamanho);

    if (status != MFRC522::STATUS_OK)
        return false;

    // Monta uma string com os 16 bytes lidos
    char texto[17];

    for (byte i = 0; i < 16; i++)
        texto[i] = (char)buffer[i];

    texto[16] = '\0';

    rfid.PCD_StopCrypto1();

    return strcmp(texto, mensagemEsperada) == 0;
}
