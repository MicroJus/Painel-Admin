#!/bin/bash


#MODIFICAÇÃO
#21/09/2020

#AUTOR:
# MERCENÁRIO

#DESENVOLVEDOR:
# MICROJUS

#PROGRAMA:
# PAINEL ADMIN

#SITE:
# https://github.com/MicroJus/Painel-Admin

#---------------------DESCRIÇÃO--------------------------#
# ESTE PROGRAMA É DESTINADO ESPECIFICAMENTE PARA USUARIOS
# INICIANTES EM LINUX, COM SUA AMPLA DISPONIBILIDADE DE
# FUNÇÕES AUTOMATIZADAS. PORÉM, USUARIOS CUJO NIVEL
# É INTERMEDIARIO OU AVANÇADO, TAMBÉM TEM SEU LUGAR EM
# "FERRAMENTAS AVANÇADAS", E OBVIAMENTE, SINTA-SE AVONTADE
# PARA DESFRUTAR DAS FUNÇÕES AUTOMATICAS EM PROL DE UMA
# OTIMIZAÇÃO DO SEU TEMPO.


#LICENÇA:

#MIT License

#Copyright (c) 2020 MicroJus
#
# Permission is hereby granted, free of charge,
# to any person obtaining a copy
# of this software and associated documentation
# files (the "Software"), to deal
# in the Software without restriction, including
# without limitation the rights
# to use
# copy, modify, merge, publish, distribute,
# sublicense, and/or sell
# copies of the Software, and to permit persons
# to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission
# notice shall be included in all
# copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY
# OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE
# WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE
# AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM,
# DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
# TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE
# SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.


#Cores
red='\e[1;31m'
green='\e[1;32m'
blue='\e[1;34m'
purple='\e[1;35m'
icyan='\e[1;36m'
white='\e[1;37m'
yellow='\e[1;33m'

clear



#FUNÇOES DO MENU PRINCIPAL

Menu() {
		clear
		echo -e "$green<$blue====================$icyan=========================$blue=================$green>"
        	echo
		toilet -f smblock --filter border:metal '		Painel Admin!		'
	        echo -e "$blue ----------------------(Micro Assistente)--------------------"
        	echo
	        echo -e "$green<$blue====================$icyan=========================$blue=================$green>"
        	echo
	        echo -e "$icyan[Opções Disponiveis]"
	        echo "--------------------"
		echo "1 - Ferramentas Comuns"
		echo "2 - Ferramentas Avançadas"
		echo "3 - Informações do Dispositivo"
		echo "4 - Scripts Uteis"
		echo "5 - Exit"
read -p $'\n\e[1;92m[\e[0m\e[1;77m+\e[0m\e[1;92m] Digite um das opções: \e[0m' opcao
	case $opcao in
	1) Comum ;;
	2) Advanced ;;
	3) Info ;;
	4) Scripts ;;
	5) Sair ;;
	*)
	clear ; echo -e "$red Opcao desconhecida." ; sleep 1 ; clear ; Menu
	esac
	}

Info() {

var=$(find -name dep-painel)

	clear
	cd "$var" && bash myfetch.sh
		echo
		echo -e "$icyan Pressione 0 para voltar ao Menu Inicial."
	read voltar
if [ $voltar = 0 ]; then
	clear
	Menu
	else
		echo -e "$red Opção Invalida!!!"
	sleep 1
	clear
	Menu
fi
	}

Scripts() {

	echo "Teste"
	sleep 1
	Menu
}

Sair() {
	clear
		echo -e "$icyan Até logo!"
	sleep 1
	clear
	exit 0
	}

Advanced() {
	clear
		echo -e "$green<$red====================$yellow===========$yellow==============$red=================$green>"
                echo
	        toilet -f smblock --filter border:metal '              Painel Admin!            '
                echo -e "$blue ----------------------(Micro Assistente)--------------------"
                echo
                echo -e "$green<$red====================$yellow======$yellow===================$red=================$green>"
		echo
                echo -e "$red[Opções Avançadas Disponiveis]"
                echo "-----------------------------"
                echo "1 - Criar payload"
                echo "2 - Voltar "
		echo
read -p $'\n\e[1;31m[\e[0m\e[1;77m+\e[0m\e[1;31m] Digite um das opções: \e[0m' resposta
	clear

if [ $resposta = 1 ]; then

	Payload

elif [ $resposta = 2 ]; then
	Menu
	else
	clear
		echo -e "$red Opção invalida!!!"
	sleep 1
	clear
	Advanced
fi

Advanced

}

Comum() {
	clear
		echo -e "$icyan[Opções Disponiveis]"
        	echo "--------------------"
		echo "[ 1 ] Mover"
		echo "[ 2 ] Renomear"
		echo "[ 3 ] Criar"
		echo "[ 4 ] Instalar"
		echo "[ 5 ] Desistalar"
		echo "[ 6 ] Excluir"
		echo "[ 7 ] Backup"
		echo "[ 8 ] Atualizar"
		echo "[ 9 ] Voltar "
		echo -e "$green"
		read -p $'\n\e[1;92m[\e[0m\e[1;77m+\e[0m\e[1;92m] Digite uma opção: \e[0m' resposta2
		clear

if [ $resposta2 = 1 ]; then

	Mover

elif [ $resposta2 = 2 ]; then

	Renomear

elif [ $resposta2 = 3 ]; then
	
	Criar

elif [ $resposta2 = 4 ]; then 

	Instalar

elif [ $resposta2 = 5 ]; then

	Desisntalar

elif [ $resposta2 = 6 ]; then

	Excluir

elif [ $resposta2 = 7 ]; then
	
	Backup

elif [ $resposta2 = 8 ]; then

	Atualizar

elif [ $resposta2 = 9 ]; then

        Menu
else
	clear
        	echo -e "$red Opção invalida!!"
        sleep 1
        clear
	Comum
fi

}


#Funçoes comuns

Mover(){	

clear
read -p $'\n\e[1;92m[\e[0m\e[1;77m+\e[0m\e[1;92m] Informe o local do arquivo: \e[0m' local

if [ "$local" == "" ]; then
	clear
	echo -e "$red Esta Vazio!!!"
	sleep 2

	Comum
 
else

if [ $local = 0 ]; then

	Comum

else

if [ -e $local ]; then
		echo -e "$icyan Arquivos do diretório $local"
        	echo -e "$blue--------------------------------------------------------------"
	        echo
		cd $local && ls
		echo
	        echo -e "$blue--------------------------------------------------------------"
        	echo

else 
	echo -e "$red O local nao existe!!!"
	sleep 1
	clear

Comum

fi
fi
fi 

read -p $'\n\e[1;92m[\e[0m\e[1;77m+\e[0m\e[1;92m] Digite o nome do arquivo junto da sua extensão: \e[0m' archive
	clear
if [ -e $archive ]; then
	clear
read -p $'\n\e[1;92m[\e[0m\e[1;77m+\e[0m\e[1;92m] Informe o local de destino: \e[0m' destino
else
		echo -e "$red O arquivo não existe"
	sleep 1
	clear

Comum

fi

if [ -d "$destino" ];then
		echo -e "$green Movendo"
	sleep 1
	clear
	cd $local && mv $archive $destino
                echo -e "$green Movido!!!"
        sleep 1
Comum

else
	clear
		echo -e "$red O destino o nao existe!!!"
	sleep 2
Comum
fi

}

#========================================================================

Renomear(){

	clear
read -p $'\n\e[1;92m[\e[0m\e[1;77m+\e[0m\e[1;92m] Informe o local do arquivo que deseja renomear: \e[0m' local2

if [ $local2 = 0 ]; then

	Comum

fi

if [ ! -d "$local2" ]; then

	clear
		echo -e "$red O local não existe!"
	sleep 1
	clear
	Comum
	fi
	clear
		echo -e "$icyan Arquivos do diretório $local2"
		echo -e "$blue--------------------------------------------------------------"
		echo
	cd $local2 && ls
echo
echo -e "$blue--------------------------------------------------------------"
echo
read -p $'\n\e[1;92m[\e[0m\e[1;77m+\e[0m\e[1;92m] Digite o nome do arquivo que deseja renomear junto da sua extensão: \e[0m' lastname
	clear
	DIR=$local2
	FILE=$lastname
if [ -e "$FILE" ]; then
		echo -e "$red O arquivo existe $red"
	else
		echo -e "$red O arquivo digitado não existe"
	sleep 1
	Comum
fi
	clear
read -p $'\n\e[1;92m[\e[0m\e[1;77m+\e[0m\e[1;92m] Informe um novo nome para o arquivo junto da sua extensão: \e[0m' newname
	clear
		echo -e "$green Renomeando..."
	sleep 1
	clear
	cd $local2 && mv $lastname "$newname"
		echo -e "$green Renomeado com sucesso!!!"
	sleep 1
	clear
	Comum
	
}

#========================================================================
Criar(){
clear		
ptintf $'\n\e[1;92m[\e[0m\e[1;77m+\e[0m\e[1;92m] O que feseja criar?: \e[0m'
		echo
		echo "[ 1 ] Pasta"
		echo "[ 2 ] Arquivo"
		echo
read -p $'\n\e[1;92m[\e[0m\e[1;77m+\e[0m\e[1;92m] Digite uma opcão: \e[0m' criacao
	clear

if [ $criacao = 1 ]; then
		echo -e "$green"
read -p $'\n\e[1;92m[\e[0m\e[1;77m+\e[0m\e[1;92m] Informe um nome para a pasta: \e[0m'name
	clear
read -p $'\n\e[1;92m[\e[0m\e[1;77m+\e[0m\e[1;92m] Informe um destino para a pasta: \e[0m'destino
	clear
		echo -e "$green $greem[$white+$green] Criando..."
	sleep 1
	clear
		echo -e "$green $greem[$white+$green] Criado com sucesso!!!"
	sleep 1
	clear
		cd $destino && mkdir $name
		clear
Comum
fi

if [ $criacao = 2 ]; then
		echo -e "$green"
read -p $'\n\e[1;92m[\e[0m\e[1;77m+\e[0m\e[1;92m] Informe um nome para o arquivo junto da sua extensão: \e[0m'name3
	clear
read -p $'\n\e[1;92m[\e[0m\e[1;77m+\e[0m\e[1;92m] Informe um destino para o arquivo: \e[0m' destino3
	clear
		echo -e "$green $greem[$white+$green] Criando..."
        sleep 1
        clear
		echo -e "$green $greem[$white+$green] Criado com sucesso!!!"
        sleep 1
        clear
		cd $destino3 && touch $name3

Comum
fi

}

#========================================================================
Instalar(){

	Comum

}

#========================================================================
Desinstalar(){

	Comum

}

#========================================================================
Excluir(){

	Comum
}

#========================================================================

Backup(){

	clear

	read -p $'\n\e[1;92m[\e[0m\e[1;77m+\e[0m\e[1;92m] Informe o local a ser (Beackapado): \e[0m' local

	if [ ! -d "$local" ]; then
        
		clear
        
	echo -e "$red O local não existe!"
        
	sleep 1
        clear
        
	Comum
        
		fi	

	clear
	
	read -p $'\n\e[1;92m[\e[0m\e[1;77m+\e[0m\e[1;92m] Informe um nome para o : \e[0m' nome
	
	clear
	
	echo "Informe o destino do backup:"
	
			read -p "->" destino
		zip -r $destino/"$nome".zip $local
	
	sleep 1
	clear

}

#========================================================================
Atualizar(){

	clear
	toilet -w 34 -f smblock --filter border:metal 'VERIFICANDO ATUALIZAÇÃO'
	sleep 1
		echo "$(date '+%D %T' | toilet -f term -F border --metal)"
	apt full-upgrade -y
	apt update && apt upgrade -y
	clear
	toilet -f smblock --filter metal '____________________'
	toilet -f mono9 -F metal "SUCESSO"
	toilet -f smblock --filter metal '^^^^^^^^^^^^^^^^^^^^'
	sleep 2
	clear
	Comum
}
#advanced
#+==========================================================================

Payload(){

echo
echo -e "$red		         __________"
echo -e "$red                      .~#########%%;~."
echo -e "$red                     ¦############%%;¬¦"
echo -e "$red                    ¦############%%;,;,¦"
echo -e "$red                   |#############;;;;.,.|"
echo -e "$red                   |###########%;;;;;.,.|"
echo -e "$red          XX       |##/~~\####%;;;/~~\;,|       XX"
echo -e "$red        XX..X      |#|  o  \##%;/  o  |.|      X..XX"
echo -e "$red      XX.....X     |##\____/##%;\____/.,|     X.....XX"
echo -e "$red  XXXXX.....XX      \#########/\;;;;;;,, /      XX.....XXXXX"
echo -e "$red X |......XX%,.@      \######/%;\;;;;, /      @#%,XX......| X"
echo -e "$red X |.....X  @#%,.@     |######%%;;;;,.|     @#%,.@  X.....| X"
echo -e "$red X  \...X     @#%,.@   |# # # % ; ; ;,|   @#%,.@     X.../  X"
echo -e "$red  X# \.X        @#%,.@                  @#%,.@        X./  #"
echo -e "$red  ##  X          @#%,.@              @#%,.@          X   #"
echo -e "$red   # #X            @#%,.@          @#%,.@            X ##"
echo -e "$red   ^###X             @#%,.@      @#%,.@             ####;"
echo -e "$red  . ¡ ###              @#%.,@  @#%,.@              ###!"
echo -e "$red    .  X#                @#%.@#%,.@                ;x#  ."
echo -e "$red      °                    @#%,.@                   §."
echo -e "$red      ° ,                @#%,.@  @@                 -"
echo -e "$red                          @@@  @@@  "
echo
echo -e "$yellow		(Todo Sistema é Vulneravel)"
	sleep 2
		echo
read -p $'\n\e[1;31m[\e[0m\e[1;77m+\e[0m\e[1;31m] Digite um nome para o payload: \e[0m' payload_name
		echo
read -p $'\n\e[1;31m[\e[0m\e[1;77m+\e[0m\e[1;31m] Informe o LPORT: \e[0m' payload_lport
		echo
read -p $'\n\e[1;31m[\e[0m\e[1;77m+\e[0m\e[1;31m] Informe o LHOST: \e[0m' payload_lhost
		echo
		cat  "/data/data/com.termux/files/home/projetos/Painel Admin/platforms/plataformas.txt"
		echo
read -p $'\n\e[1;31m[\e[0m\e[1;77m+\e[0m\e[1;31m] Informe a plataforma a ser explorada: \e[0m' payload_plataforma
		echo
read -p $'\n\e[1;31m[\e[0m\e[1;77m+\e[0m\e[1;31m] Informe a arwuitetura do payload: \e[0m' payload_arch
		echo
read -p $'\n\e[1;31m[\e[0m\e[1;77m+\e[0m\e[1;31m] Informe um destino para o payload: \e[0m' payload_destino
		clear
		echo
		echo -e "$green $greem[$white+$green] NOME: $payload_name"
		echo
		echo -e "$green $greem[$white+$green] LPORT: $payload_lport"
		echo
		echo -e "$green $greem[$white+$green] LHOST: $payload_lhost"
		echo
		echo -e "$green $greem[$white+$green] PLATAFORMA: $payload_plataforma"
		echo
		echo -e "$green $greem[$white+$green] ARQUITETURA: $payload_arch"
		echo
read -p $'\n\e[1;31m[\e[0m\e[1;77m+\e[0m\e[1;31m] As informações a cima estão corretas? s/n: \e[0m' payload_resposta
		echo
if [ $payload_resposta = s ]; then
	echo "Nada"
	sleep 1
	clear
		echo -e "$green Criando Payload"
	clear
	Advanced
else
	echo "Opção Invalida!!!"
	sleep 1
	clear
fi


}

Menu
