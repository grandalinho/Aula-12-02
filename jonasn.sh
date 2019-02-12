#!/bin/bash
#Criação das variaveis locais
USUARIO="root"
TESTE01=$(test A == B ; echo $?)
TESTE02=$(test -f /etc/passwd ; echo $?)
USUARIOS=$(who | awk '{print $1}')

#Utilizando o comando echo para imprimir na tela os valores das variaveis locais
#e variaveis especiais do shell
echo "impressão na tela..............: olá, mundo!!!"
echo "Nome do usuario................: $USUARIO"
echo "Nome do arquivo de shell.......: $0"
echo "Quantidade de parametros.......: $#"
echo "Todos os parametros............: $*"
echo "Parametro 01...................: $1"
echo "Parametro 02...................: $2"
echo "Status do comando anterior.....: $?"
echo "PID do processo................: $$"
echo "Comando: test A == B...........: $TESTE01"
echo "Comando: test -f /etc/passwd...: $TESTE02"
echo "Usuarios logados...............: $USUARIOS"

#Utilizando comando if para fazer os testes logicos e 
#validar o ambiente 
if [ $USUARIO == root ];
then 
	echo "Teste de usuario:..............: Usuario é root"
else 
	echo "Teste de usuario:..............: Usuario não é root"
fi

#utilizando o comando if encadeado para aumentar a quantidade dos
#testes logicos
if [ $TESTE01 -eq 0 ];
then
	echo "Resultado do comando teste é...: VERDADEIRO"
elif [ $TESTE01 -eq 1 ];
then
	echo "Resultado do comando teste é...: FALSO"
fi

#Utilizando o comando case para fazer os testes logicos
#e validar o ambiente 
case $TESTE01 in 
	0) echo "Resultado do comando case é....: 0 - VERDADEIRO";;
	1) echo "Resultado do comando case é....: 1 - FALSO";;
	*) echo "Resultado do comando case é....: NÃO INDENTIFICADO"
esac

#Utilizando o comando read para receber os 
#valores e fazer o teste lgico com case
read -p "Digitie as letras: A, B ou C..............: " LETRAS;
case $LETRAS in
	A|a) echo "A letra digitada foi.......................: $LETRAS";;
	B|B) echo "A letra digitada foi.......................: $LETRAS";;
	C|c) echo "A letra digitada foi.......................: $LETRAS";;
 	*) echo "Letra digitada errada .......................: $LETRAS"
esac

#Utilizando o laço de loop for para verificar os numeros digitados 
#junto com o comando read
read -p "Uma sequencia de numeros............: " NUMEROS;
for VALORES in $NUMEROS;
do
	echo "Numeros passados para o Loop.......: $VALORES"
done


#Utilizando o laço de looping for para gerar uma tabuada junto com o 
#comando read
read -p "Digite um numero da tabuada...........: " NUMERO;
for TABUADA in $(seq 0 10);
do
	echo "$NUMERO X $TABUADA........: $(($TABUADA * $NUMERO))"
done

#Utilizando o laço de loop while para alcançar os valores
#desejados com o comando read
read -p "digite um numero de inicio.....: " INICIO;
read -p "digite um numero de fim........: " FIM;
while [ $INICIO -le $FIM ];
do
	echo "valor de sequencia numerica.......: $INICIO"
	let INICIO=INICIO+1
done
	




























