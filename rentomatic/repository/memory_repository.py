from rentomatic.domain.room import Room


class MemoryRepository:
    def __init__(self, data):
        self.data = data

    def list(self):
        return [Room.from_dict(i) for i in self.data]
