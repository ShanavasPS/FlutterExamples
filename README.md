# Learn flutter with examples

This project is aimed at learning flutter using examples

## Getting Started

Add a new configuration with one of the files listed below as entrypoint if you want to run it.

1. stateless_widget.dart - A simple multiple widget app that does not respond to any user interaction and does not have any state change.
                           Stateless widgets are used when you do not modify any of its contents once it's built.
2. stateful_widget.dart - This example shows how to add interactivity to your app so that it can react to user input.
                          We need to create a custom Stateful widget that manages stateless widget.
3. inherited_widget.dart - This example shows how to use an inherited widget to avoid passing data down to each child widgets.
4. provider.dart - This example shows how to use the Provider Consumer state management.
                   Advantages compared to Inherited Widget is that you don't need to setup a separate Stateful widget class for class.
                   Also no need to use InitState and SetState methods for state update.
                   This needs the Provider package and make sure it is already added to your project using the command 
                   ```flutter pub add provider```
5. multiple_providers.dart - This example shows how to use multiple Providers and how to consume multiple providers.
                             Similar advantages as the previous example.
                            Make sure to install the provider package as in the previous example.