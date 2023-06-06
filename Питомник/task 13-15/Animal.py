class Animal:

    def __init__(self, name, date_of_birth):
        self.name = name
        self.date_of_birth = date_of_birth
        self.list_commands = []

    def set_commands(self):
        return self.list_commands

    def add_commands(self, commands):
        self.list_commands.append(commands)

    def __str__(self):
        return f"name = {self.name}\n" \
               f"date of birth = {self.date_of_birth}"

