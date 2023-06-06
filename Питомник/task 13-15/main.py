from Dogs import Dogs
from Cats import Cats
from Donkey import Donkey
from Hamsters import Hamsters
from Hors import Hors
from Camels import Camels
from AnimalRegistry import AnimalRegistry
from Counter import Counter


def menu():
    registry = AnimalRegistry()
    count = Counter()
    cycle = True
    while cycle:
        print(f"\nРеестр домашних животных\n{'=' * 30}\n"
              + "1 - Завести новое животное\n"
              + "2 - Увидеть список команд животного\n"
              + "3 - Обучить животное новой командой\n"
              + "4 - Выйти из приложения\n"
              + "=" * 30)
        try:
            enter = int(input())
        except ValueError:
            print("Введите число!")
            menu()
        match enter:
            case 1:
                print("Какое животное хотите?\n"
                      + "1 - Dog\n"
                      + "2 - Cats\n"
                      + "3 - Hamsters\n"
                      + "4 - Hors\n"
                      + "5 - Camels\n"
                      + "6 - Donkey\n")
                try:
                    enter_animal = int(input())
                except ValueError:
                    print("Введите число!")
                match enter_animal:
                    case 1:
                        print("Введите данные\n", "Имя: ")
                        name = input()
                        print("Дату рождения: ")
                        date = input()
                        print("Какую команду он может выполнять?\n")
                        command = input()
                        registry.add(count.add(), Dogs(name, date, command))
                    case 2:
                        print("Введите данные\n", "Имя: ")
                        name = input()
                        print("Дату рождения: ")
                        date = input()
                        print("Какую команду он может выполнять?\n")
                        command = input()
                        registry.add(count.add(), Cats(name, date, command))
                    case 3:
                        print("Введите данные\n", "Имя: ")
                        name = input()
                        print("Дату рождения: ")
                        date = input()
                        registry.add(count.add(), Hamsters(name, date))
                    case 4:
                        print("Введите данные\n", "Имя: ")
                        name = input()
                        print("Дату рождения: ")
                        date = input()
                        print("Какую команду он может выполнять?\n")
                        command = input()
                        registry.add(count.add(), Hors(name, date, command))
                    case 5:
                        print("Введите данные\n", "Имя: ")
                        name = input()
                        print("Дату рождения: ")
                        date = input()
                        print("Какую команду он может выполнять?\n")
                        command = input()
                        registry.add(count.add(), Camels(name, date, command))
                    case 6:
                        print("Введите данные\n", "Имя: ")
                        name = input()
                        print("Дату рождения: ")
                        date = input()
                        print("Какую команду он может выполнять?\n")
                        command = input()
                        registry.add(count.add(), Donkey(name, date, command))
            case 2:
                registry.print()
                continue
            case 3:
                registry.print()
                print("Введите ID вашего животного: ")
                key = int(input())
                if key in registry.get_dict():
                    print("Какую команду добавить для вашего животного?\n")
                    value = input()
                    registry.get_dict().get(key).add_commands(value)
                    continue
                else:
                    print(key)
                    print("Нет такого ID")
                    continue
            case 4:
                cycle = False


menu()
