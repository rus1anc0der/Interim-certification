from Animal import Animal


class Hors(Animal):

    def __init__(self, name, date_of_birth, commands):
        super().__init__(name, date_of_birth)
        self.commands = commands
        self.add_commands(commands)

    def print_info(self):
        super().print_info()
        print(f"commands = {self.list_commands}")


