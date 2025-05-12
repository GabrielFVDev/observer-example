# Flutter Overlay Observer Example

Este projeto demonstra como gerenciar overlays em Flutter utilizando um service centralizado e um `NavigatorObserver` personalizado para garantir que overlays sejam fechados automaticamente durante a navegação entre rotas.

## Funcionalidades

- Exibição de overlays customizados em qualquer tela.
- Fechamento automático do overlay ao navegar entre páginas (push/pop), usando um observer.
- Fechamento manual do overlay por ação do usuário.
- Navegação declarativa utilizando [Routefly](https://pub.dev/packages/routefly).

## Estrutura Principal

- `lib/app/service/overlay_service.dart`: Service singleton para exibir e remover overlays.
- `lib/app/observer/overlay_route_observer.dart`: Observer que fecha overlays automaticamente em navegação.
- `lib/app/view/`: Contém as páginas do app, como `home_page.dart` e `teste_page.dart`.
- `lib/app/app_widget.dart`: Widget principal, configura rotas e observers.

## Como executar

1. Instale as dependências:

   ```sh
   flutter pub get
   ```

2. Gere as rotas com o Routefly:

   ```sh
   dart run routefly
   ```

3. Execute o app:
   ```sh
   flutter run
   ```

## Recursos úteis

- [Documentação Flutter](https://docs.flutter.dev/)
- [Routefly](https://pub.dev/packages/routefly)

---

Projeto desenvolvido para estudo de navegação e overlays em Flutter.
