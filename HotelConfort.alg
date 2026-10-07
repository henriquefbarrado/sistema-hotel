Algoritmo "HotelConfort"
// Prototipo do sistema de reservas do Hotel Confort
// Feito em VisualG, seguindo o modelo do sistema da biblioteca digital

Var
   // cada posicao guarda o nome de quem reservou o quarto (texto vazio = quarto livre)
   // posicao 1 = quarto 101, posicao 2 = quarto 102 ... posicao 5 = quarto 105
   reservas: vetor[1..5] de caractere
   opcao, i: inteiro

// ---------------------------------------------------------------
// Tela inicial: so mostra a mensagem de boas-vindas
// ---------------------------------------------------------------
Procedimento TelaInicial
Inicio
   escreval("========================================")
   escreval("       BEM-VINDO AO HOTEL CONFORT       ")
   escreval("========================================")
   escreval("Sistema de reservas de quartos")
   escreval("")
FimProcedimento

// ---------------------------------------------------------------
// Menu principal: apenas exibe as opcoes (a escolha e lida no programa principal)
// ---------------------------------------------------------------
Procedimento MenuPrincipal
Inicio
   escreval("------------ MENU PRINCIPAL ------------")
   escreval("1 - Consultar quartos disponiveis")
   escreval("2 - Reservar um quarto")
   escreval("3 - Cancelar uma reserva")
   escreval("4 - Fale conosco")
   escreval("5 - Sair")
   escreval("----------------------------------------")
   escreva("Escolha uma opcao: ")
FimProcedimento

// ---------------------------------------------------------------
// Consultar quartos: lista so os que ainda estao livres
// ---------------------------------------------------------------
Procedimento ConsultarQuartos
Var
   q, livres: inteiro
Inicio
   livres <- 0
   escreval("")
   escreval("--- QUARTOS DISPONIVEIS ---")
   Para q de 1 ate 5 faca
      Se reservas[q] = "" Entao
         // o numero do quarto e a posicao + 100 (posicao 1 vira 101)
         escreval("Quarto ", 100 + q, " - Disponivel")
         livres <- livres + 1
      FimSe
   FimPara
   // se o contador ficou zerado, nenhum quarto estava livre
   Se livres = 0 Entao
      escreval("Nao ha quartos disponiveis no momento.")
   FimSe
FimProcedimento

// ---------------------------------------------------------------
// Reservar quarto: pede nome e numero do quarto e confere se da pra reservar
// ---------------------------------------------------------------
Procedimento ReservarQuarto
Var
   nome: caractere
   numero, indice: inteiro
Inicio
   escreval("")
   escreval("--- RESERVAR QUARTO ---")
   escreva("Digite o seu nome: ")
   leia(nome)
   escreva("Digite o numero do quarto (101 a 105): ")
   leia(numero)

   Se nome = "" Entao
      escreval("O nome nao pode ficar vazio. Reserva nao realizada.")
   Senao
      Se (numero < 101) ou (numero > 105) Entao
         escreval("Quarto inexistente! Escolha um numero entre 101 e 105.")
      Senao
         // converte o numero do quarto na posicao do vetor
         indice <- numero - 100
         Se reservas[indice] <> "" Entao
            escreval("Desculpe, o quarto ", numero, " ja esta reservado.")
         Senao
            reservas[indice] <- nome
            escreval("Reserva confirmada! ", nome, ", o quarto ", numero, " e seu.")
         FimSe
      FimSe
   FimSe
FimProcedimento

// ---------------------------------------------------------------
// Cancelar reserva: so cancela se o quarto estiver reservado no nome informado
// ---------------------------------------------------------------
Procedimento CancelarReserva
Var
   nome: caractere
   numero, indice: inteiro
Inicio
   escreval("")
   escreval("--- CANCELAR RESERVA ---")
   escreva("Digite o seu nome: ")
   leia(nome)
   escreva("Digite o numero do quarto (101 a 105): ")
   leia(numero)

   Se (numero < 101) ou (numero > 105) Entao
      escreval("Quarto inexistente! Escolha um numero entre 101 e 105.")
   Senao
      indice <- numero - 100
      Se reservas[indice] = "" Entao
         escreval("O quarto ", numero, " nao possui reserva para cancelar.")
      Senao
         // Maiusculo ignora diferenca entre "ana" e "Ana"
         Se Maiusculo(reservas[indice]) <> Maiusculo(nome) Entao
            escreval("A reserva do quarto ", numero, " nao esta no nome de ", nome, ".")
         Senao
            reservas[indice] <- ""
            escreval("Reserva cancelada! ", nome, ", o quarto ", numero, " esta livre novamente.")
         FimSe
      FimSe
   FimSe
FimProcedimento

// ---------------------------------------------------------------
// Fale conosco: dados de contato (ficticios, so para o prototipo)
// ---------------------------------------------------------------
Procedimento FaleConosco
Inicio
   escreval("")
   escreval("--- FALE CONOSCO ---")
   escreval("Hotel Confort")
   escreval("Telefone: (11) 4002-8922")
   escreval("E-mail: contato@hotelconfort.com.br")
   escreval("Endereco: Av. Principal, 1000 - Centro")
   escreval("Atendimento: todos os dias, das 8h as 22h")
FimProcedimento

// ---------------------------------------------------------------
// Programa principal
// ---------------------------------------------------------------
Inicio
   // no comeco todos os quartos estao livres
   Para i de 1 ate 5 faca
      reservas[i] <- ""
   FimPara

   TelaInicial

   // o menu se repete ate o usuario escolher a opcao 5 (Sair)
   Repita
      MenuPrincipal
      leia(opcao)

      Escolha opcao
         Caso 1
            ConsultarQuartos
         Caso 2
            ReservarQuarto
         Caso 3
            CancelarReserva
         Caso 4
            FaleConosco
         Caso 5
            escreval("")
            escreval("Obrigado por usar o sistema do Hotel Confort. Ate logo!")
         OutroCaso
            escreval("")
            escreval("Opcao invalida! Digite um numero de 1 a 5.")
      FimEscolha

      escreval("")
   Ate opcao = 5
FimAlgoritmo
