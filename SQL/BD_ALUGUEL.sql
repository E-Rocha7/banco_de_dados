CREATE DATABASE IF NOT EXISTS BD_ALUGUEL;
USE BD_ALUGUEL; 

CREATE TABLE IF NOT  EXISTS CLIENTE(
	CLI_ID INT AUTO_INCREMENT PRIMARY KEY,
    CLI_NOME VARCHAR(50) NOT NULL,
    CLI_CPF VARCHAR(11) NOT NULL,
    CLI_EMAIL VARCHAR(50) NOT NULL,
    CLI_TELEFONE VARCHAR(9) NOT NULL
);

ALTER TABLE CLIENTE
MODIFY COLUMN CLI_CPF VARCHAR(11) NOT NULL UNIQUE;

CREATE TABLE IF NOT EXISTS PRODUTO(
	PRO_ID INT AUTO_INCREMENT PRIMARY KEY,
    PRO_NOME VARCHAR(50) NOT NULL,
    PRO_DESCRICAO VARCHAR(200),
    PRO_PRECO DOUBLE NOT NULL,
    PRO_QTD_DISPONIVEL INT NOT NULL
);

CREATE TABLE IF NOT EXISTS ALUGUEL(
	ALU_ID	INT AUTO_INCREMENT PRIMARY KEY,
    ALU_DATA_ALUGUEL DATE NOT NULL,
    ALU_DATA_DEVOLUCAO DATE NOT NULL,
    ALU_VALOR_TOTAL DOUBLE NOT NULL,
    FK_CLI_ID INT,
    FOREIGN KEY (FK_CLI_ID) REFERENCES CLIENTE(CLI_ID)
    );
    
    CREATE TABLE IF NOT EXISTS ALUGUEL_PRODUTO(
		ALP_ID INT AUTO_INCREMENT PRIMARY KEY,
        FK_PRO_ID	INT NOT NULL,
        FK_ALU_ID INT NOT NULL,
        FOREIGN KEY (FK_PRO_ID) REFERENCES PRODUTO(PRO_ID),
        FOREIGN KEY (FK_ALU_ID) REFERENCES ALUGUEL(ALU_ID)
    );
    
    INSERT INTO CLIENTE (CLI_NOME, CLI_CPF, CLI_EMAIL, CLI_TELEFONE)
    VALUES ("Enzo", "54796093869","enzo@email.com", "995259876");
    
     INSERT INTO CLIENTE (CLI_NOME, CLI_CPF, CLI_EMAIL, CLI_TELEFONE)
    VALUES ("MATEUS", "54796094469","mateus@email.com", "994669876");
    
    SELECT * FROM CLIENTE;
    
    INSERT INTO PRODUTO (PRO_NOME,
						  PRO_PRECO,
						  PRO_QTD_DISPONIVEL)
  VALUES                        ("Iphone 18 pro max",
							589.90,
                            100);
                            
	 INSERT INTO PRODUTO (PRO_NOME,
						  PRO_DESCRICAO,
						  PRO_PRECO,
						  PRO_QTD_DISPONIVEL)
  VALUES                   ("Lancha Turbo",
							 "Lancha para rio e mar",
							2358.75,
                            5);
	
SELECT * FROM PRODUTO;
    
INSERT INTO ALUGUEL(ALU_DATA_ALUGUEL,
					ALU_DATA_DEVOLUCAO,
                    ALU_VALOR_TOTAL,
                    FK_CLI_ID)
			VALUES ("2026-10-08",
					"2026-10-15",
                    600.89,
                    2);
			
SELECT * FROM ALUGUEL;
        
INSERT INTO ALUGUEL_PRODUTO(FK_PRO_ID,FK_ALU_ID)
VALUES (1,1);

SELECT * FROM ALUGUEL_PRODUTO;

INSERT INTO CLIENTE (CLI_NOME, CLI_CPF, CLI_EMAIL, CLI_TELEFONE)
VALUES ("Ana silva", "89275082030", "ana.silva@gmail.com" "993458769"),
("Bruno Souza", "38748188026", "bruno.silva@gmail.com" "996478560"),
 ("Carla mandes", "90178194050", "carla.mendes@gmail.com" "996478456"),
("Daniel rocha", "60493661018", "daniel.rocha@gmail.com" "768478456");

INSERT INTO PRODUTO (PRO_NOME, PRO_DESCRICAO, PRO_PRECO, PRO_QTD_DISPONIVEL)
VALUES ("notbook dell inspiron","notbook com processador intel core i7, 16gb de RAM, 512gb ssd", "450", "10"),
	   ("smartphone samsung galaxy s21", "smartphone com tela de 6,2 polegadas, 128gb de armazenament", "350", "15"),
       ("tv lg 55 4k", "smart tv com resolução 4k e hdr", "280", "8"),
       ("drone dji phantom 4","drone com camera 4k e estabilização de imagem","300", "55"),
       ("câm. Canon EOSI t7", "camera dsrl com lente de 18-55mm, 24.1MP", "250", "2"),
       ("camera GoPro hero 9", "camera de ação com resolução 5K e resistencia a agua,", "80", "60"),
	   ("tenda eventos 5x5m", "tenda resistente a agua e facil de montar", "200", "4"),
       ("microfone shure SM58", "microfone para apresentações e shows", "40", "35"),
       ("mesa de sm=om behringer", "mesa de som com 16 canais e efeitos integrados", "500", "3"),
       ("kit de iluminaçao fotografica", "kit com softbox, tripes e lampadas de LED", "100","6");
       
  SELECT * FROM PRODUTO;   
  SELECT PRO_NOME, PRO_DESCRICAO FROM PRODUTO;
  SELECT PRO_NOME, PRO_DESCRICAO, PRO_PRECO FROM PRODUTO;
  
  -- SELECIONAR APENAS OS PRODUTOS COM PRECO > 250
  SELECT *
  FROM  PRODUTO
  WHERE PRO_PRECO > 250;
  
  -- SELECIONAR APENAS O PRODUTO DE ID = 3
  SELECT PRO_ID, PRO_NOME
  FROM PRODUTO
  WHERE PRO_ID = 3;
	
-- SELCIONAR TODOS OS PRODUTOS QUE CONTENHAM NOTBOOK EM QUALQUER PARTE DO NOME
SELECT *
FROM PRODUTO
WHERE PRO_ID = 3 ;


--  ATUALIZAR A QUANTIDADE DE NOTBOOK PARA 200
UPDATE PRODUTO
SET PRO_QTD_DISPONIVEL = 200
WHERE PRO_NOME LIKE 'notbook'; -- UPDATE TEM QUE TER WHERE

-- ATUALIZAR A DESCRICAO DO NOTBOOK PARA VAZIO
UPDATE PRODUTO
SET PRO_DESCRICAO = NULL 
WHERE PRO_ID = 3; -- UPDATE TEM QUE TER WHERE


-- APAGAR (DELETAR) O NOTBOOK
DELETE FROM PRODUTO
WHERE PRO_ID = 3 -- DELETE TEM QUE TER WHERE