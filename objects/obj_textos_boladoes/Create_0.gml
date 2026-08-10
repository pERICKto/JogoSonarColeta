// t1 = Texto da esquerda | c1 = Cor da esquerda
// t2 = Texto da direita  | c2 = Cor da direita

linhas[0] = { t1: "hardware...        ", c1: c_white, t2: "operacional", c2: c_green };
linhas[1] = { t1: "firmware...        ", c1: c_white, t2: "ok",          c2: c_green};
linhas[2] = { t1: "RAM...             ", c1: c_white, t2: "ok",          c2: c_green };
linhas[3] = { t1: "ROM...             ", c1: c_white, t2: "ok",          c2: c_green };
linhas[4] = { t1: "CPU...             ", c1: c_white, t2: "ok",          c2: c_green };
linhas[5] = { t1: "GPU...             ", c1: c_white, t2: "FAIL",        c2: c_red };

// Linhas que não tem "status" na frente, você deixa o t2 vazio ("")
linhas[6] = { t1: "moving graphic cards to CPU",	c1: c_grey, t2: "",        c2: c_white };
linhas[7] = { t1: "....SUCESS",						c1: c_lime,  t2: "",       c2: c_white };
linhas[8] = { t1: "controller...      ",			c1: c_white, t2: "FAIL",	c2: c_red };
linhas[9] = { t1: "please connect a controller",	c1: c_yellow, t2: "",		c2: c_white};

linha_atual = 0;      
caracter_atual = 0;