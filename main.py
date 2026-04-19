class ChatBot:
    def __init__(self, name):
        self.name = name
        self.greetings = ["hello", "hi", "hey"]
        self.farewells = ["bye", "goodbye", "see you later"]

    def greet(self, message):
        for greeting in self.greetings:
            if greeting in message.lower():
                return f"Hello, I'm {self.name}! How can I assist you today?"

    def farewell(self, message):
        for farewell in self.farewells:
            if farewell in message.lower():
                return f"Goodbye, it was nice talking to you! Come back soon!"

    def handle_message(self, message):
        if self.greet(message):
            return self.greet(message)
        elif self.farewell(message):
            return self.farewell(message)
        else:
            return "I didn't understand that. Could you please rephrase?"

class User:
    def __init__(self, name):
        self.name = name
        self.bot = ChatBot("Assistant")

    def send_message(self, message):
        print(f"{self.name}: {message}")
        print(self.bot.handle_message(message))

user = User("John")
user.send_message("Hello, how are you?")
user.send_message("I'm good, thanks!")
user.send_message("Bye, see you later!")
user.send_message("What's your purpose?")
user.send_message("I'm here to help with any questions you may have")
user.send_message("Okay, thanks for the help")
user.send_message("No problem, have a great day!")
user.send_message("You too, goodbye")