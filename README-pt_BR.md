# IN8 Shop
[🇺🇸 Check this Readme in en-US](./README-pt_BR.md);

Um front end para e-commerce que consume a [E-Commerce-API](https://github.com/vasconceloscezar/e-commerce-api) para buscar os produtos e controlar login do usuário. 
![Landing Page](https://user-images.githubusercontent.com/97035956/217627728-c5aed821-a613-4169-8f95-9b08e1c48281.png)


## Índice

- [Rodar projeto local](#project-setup)
- [Decições do projeto](#project-decisions)
- [Dependencias utilizadas](#project-dependencies)


## Como executar esse projeto localmente <a name="project-setup">
Primeiramente você deve ter o Flutter e todas suas dependências instaladas, [Aqui na documentação oficial do Flutter](https://docs.flutter.dev/get-started/install), você pode seguir o passo a passo. 
Após, basta clonar esse repositório, selecionar um dispositivo para rodar em qualquer emulador, ou no seu próprio celular, e rodar o comando no terminal:

```shell
flutter run
```

## Decisões do projeto <a name="project-decisions"></a>
Pra agilizar e focar direto na lógica do front, optei por utilizar [esse repo](https://github.com/abuanwar072/E-commerce-Complete-Flutter-UI) como boilerplate.

O boilerplate nos deu algumas telas como: 
- Splash Screen
- Home
- Cart
- User Profile

Todas sem funcionalidades, apenas o front. 

Foram criados alguns [Providers](./providers/): 
- UserProvider > Guarda dados do usuário após login, assim como o token de acesso para requisições; 
- CartProvider > Toda a lógica referente à adicionar/remover produtos no carrinho, assim como a compra dos produtos. 
- ProductProvider > Responsável por chamar a API que carrega os produtos. 
- PurchasesProvider > Busca os dados de compras do usuário.


Após login, os dados do usuário são salvos localmente no dispositivo. Evitando que o usuário precise fazer login quando fechar e abrir o app novamente. 


## Dependências do projeto <a name="project-dependencies"></a>

Algumas dependências foram usadas, são elas: 

- [Flutter SVG](https://pub.dev/packages/flutter_svg) for showing svgs.
- [Provider](https://pub.dev/packages/provider), for our state management.
- [Http](https://pub.dev/packages/http), for fetching data.
- [Shared Preferences](https://pub.dev/packages/shared_preferences), para guardar dados localmente.
