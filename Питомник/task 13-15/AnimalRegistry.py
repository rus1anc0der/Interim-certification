class AnimalRegistry:

    def __init__(self):
        self.registry = {}

    def add(self, key, value):
        self.registry[key] = value

    def print(self):
        for k, v in self.registry.items():
            print("-" * 30)
            print(f"ID = {k}\n"
                  f"Animal: {v}")
        print("-" * 30)


    def get_dict(self):
        return self.registry
