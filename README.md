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
6. local_key.dart - This example shows the benefits of using a local key, (Value Key) to make sure states are updated for Stateful widgets when it is updated from another Widget.
                    This is also useful to maintain state when a widget is moved inside a list of widgets.
7. global_key.dart - The global key can be used to access a state of another widget from anywhere in the widget tree.
                     When assigned to a Form, one can access the FormStates public functions and variables and use them accordingly.
8. future_builder.dart - FutureBuilder is a Widget that will help you to execute some asynchronous function and based on that function’s result your UI will update.
                         This helps you to remove some boilerplate code that you need to do otherwise.
                         For eg; Need of using flag to differentiate status, using SetState when data is updated.
9. page_view.dart - The PageView widget allows the user to transition between different screens in their flutter application