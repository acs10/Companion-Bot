# Bot-friend
Bot-friend: A virtual companion for elderly people

Esta seção apresenta o agente, assim como detalhes da implementação, O Chatbot conforme representado na figura abaixo, está integrado ao celular do usuário, sendo ele responsável por enviar mensagens ao Dialog Manager e reproduzir as saídas recebidas do mesmo. Para uma melhor compreensão, detalhes de sua utilização são especificados logo a seguir.

<div align="center">
<img src="https://user-images.githubusercontent.com/41653617/190237227-5656cf0b-93a5-4d6d-b68a-3ba4665e4f0d.png" width="500px" />  
</div>

Na main screen basta clicar na imagem superior a frase “Toque para falar” para habilitar o microfone do dispositivo e fornecer a entrada. Após o usuário fornecer a entrada por meio da fala, é realizada  a conversão de voz para texto por meio de um plugin do próprio framework, sendo ele o speech_to_text, após esse processo a informação segue para a etapa seguinte. Aguardando o retorno para realizar o processo de síntese de voz, também por um plugin, o text_to_speech.

Para etapa de interpretação de texto e geração da resposta, ocorrendo no dialog manager, também descrito na na seção 3.3 no módulo da API, foi utilizado como base a biblioteca NLTK (Natural Language ToolKit), que é uma biblioteca de Python utilizada para NLP, consistindo no processo de desenvolvimento de algoritmos capazes de “entender” a linguagem humana. 
