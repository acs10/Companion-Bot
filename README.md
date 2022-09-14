# Bot-friend
Bot-friend: A virtual companion for elderly people

Structure:

The Companion-Bot was subdivided into two folders, the api being built using the django rest framework (https://www.django-rest-framework.org/), the mobile application. being built using Flutter(https://flutter.dev/)

    Note The database used by default by the api was PhpMyadmin. To use it, you must import the "bot.sql" file that accompanies the folders.

Implementation:
The Chatbot, as represented in the figure below, is integrated into the user's cell phone, being responsible for sending messages to the Dialog Manager, which is located in the api, and reproducing the outputs received from it. For a better understanding, details of its use are specified below.

<div align="center">
<img src="https://user-images.githubusercontent.com/41653617/190237227-5656cf0b-93a5-4d6d-b68a-3ba4665e4f0d.png" width="500px" />  
</div>

On the main screen, just click the phrase “Tap to speak” on the top image to enable the device's microphone and provide input. After the user provides the input through speech, the speech-to-text conversion is performed through a plugin of the framework itself, which is speech_to_text(https://pub.dev/packages/speech_to_text), after this process the information goes to the next step. Waiting for feedback to perform the speech synthesis process, also by a plugin, text_to_speech (https://pub.dev/packages/text_to_speech).

For text interpretation and response generation, the NLTK library (Natural Language ToolKit) was used, which is a Python library used for NLP, consisting of the process of developing algorithms capable of “understanding” human language.

The processes used with the NLTK for processing the chatbot text were the following:

    Note All the processes mentioned below exist in the processText module of the API.

  - Tokenization: Being performed by a method called "stopwords".

  - Lexical Analysis: Being performed by the speech-to-text plugin itself in the mobile application.

  - Syntactic Analysis: Performed Manually in the provided Dialogs. # Started with nfreqDisc and target methods

  - Semantic Analysis: Performed Manually in the provided Dialogs.

  - Discourse Analysis: Performed Manually in the provided Dialogs.

The work is still in progress, the manual process being carried out in the lexical analysis and later. It happened as follows. A base of dialogues was provided that, based on the post-tokenized words and removing the stopwords, weights were defined for the most relevant words. After labeling them, the possible outputs were defined according to the weight and relevance of the sum of the words.The idea is that for the process of lexical, semantic and discourse analysis, machine learning techniques are used to structure conversations aiming at a better performance of the conversational agent.
