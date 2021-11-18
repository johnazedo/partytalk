# Talk


<img src="https://user-images.githubusercontent.com/19677206/142435408-e99359bb-97ba-4ef5-9481-461a2362e955.png" width="250" height="531" />


O Talk é um aplicativo para envio de mensagens utilizando as contas do Google. Para isso é necessário a integração com o Firebase.

O projeto GoogleChat foi craido para estudar os seguintes tópicos:

- Gerência de estado com `Provider`;
- Provedor de código utilizando `Provider` para aplicar a `Injeção de dependência`;
- Integração com o Firebase para a autenticação usando o `GoogleSignIn`;
- Integração com o Firebase `FireStore` para a persistência dos dados;
- Integração com o Firebase `Storage` para o upload de arquivos;
- Utilizar a câmera do dispositivo;
- Notificações do dispositivo;
- Testes automatizados.

## Casos de uso

Os casos de uso ser serão descritos como estórias de usuário.

Os seguintes caos de uso serão necessários para a finalização do MVP do projeto:

ID | Descriçao
-|-
F01| Como usuário quero poder enviar mensagens novas a um número, ver mensagens antigas e deleta-las se eu quiser
F02| Como usuário quero poder enviar fotos da minha galeria como mensagem, ou tirar uma foto do momento atual e envia-la
F03| Como usuário quero poder ver todas as pessoas que também possuem conta no aplicativo e envia-las uma menssagem
F04| Quando uma mensagem for enviada quero saber se a mesma chegou ao seu destino
F05| Quero ser notificado quando alguma menssagem nova chegar para mim
F06| Como usuário quero ter a possibilidade de excluir minha conta
F07| Como usuário quero poder deslogar na hora que eu quiser

### Detalhamento técnico dos cados de uso

Esse detalhamento é baseados nos casos de uso, e os items descritos nele podem ser englobados como etapas que antecedem ou sucedem  de um caso de uso específico.

ID | Descrição | Caso de uso
-|-|-
NF01 | Necessária autenticação pelo Google para identificar o usuário que está usando | F01
NF02 | Listagem de conversas | F01
NF03 | Listagem de todas as mensagens enviadas e recebidas de um contato | F01
NF04 | Listagem de todos os usuários da plataforma | F03
NF05 | Cada mensagem deve ter um status de envio e leitura ao lado do texto | F04
NF06 | Oferecer uma lista de configurações onde terá a opção de apagar a conta | F06
NF07 | Oferecer uma lista de configurações onde terá a opção de deslogar | F06

## Descrição do NoSQL
![Talk](https://user-images.githubusercontent.com/19677206/129483360-5ec40938-bda5-4840-be4f-1bbf4f31ef14.png)


## Diagrama de fluxo

```
EM CONSTRUÇÃO
```
