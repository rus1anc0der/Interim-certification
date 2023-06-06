from Animal import Animal


class Camels(Animal):

    def __init__(self, name, date_of_birth, commands):
        super().__init__(name, date_of_birth)
        self.commands = commands
        self.add_commands(commands)

    def __str__(self):
        return f"{super().__str__()}\ncommands = {self.list_commands}"
