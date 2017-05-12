class Elevator:
    # to be recomputed via automatic data collection
    lightest_passenger_weight = 40

    # max_weight: max weight capacity of the elevator
    def __init__(self, max_weight, current_floor):
        self._max_weight = max_weight
        self.current_floor = current_floor
        self.is_going_up = False
        self.destinations = []

    # Returns whether there's vacancy for at least one person
    def has_vacancy(self):
        return self._has_weight_capacity() and self._has_standing_capacity()

    # Get the current weight of the elevator. Done through weight sensor in elevator
    def _get_current_weight(self):
        return 0

    # Returns whether there's sufficient weight capacity left for one person
    def _has_weight_capacity(self):
        return self._get_current_weight + Elevator.lightest_passenger_weight <= self._max_weight

    # Returns whether there's sufficient surface capacity left for one person to stand
    def _has_standing_capacity(self):
        return 0  # TODO use opencv to get this


class Floor:
    def __init__(self, floor_num):
        self.floor_num = floor_num
        self.is_up_pressed = False
        self.is_down_pressed = False
        self.has_people = False

    def get_waiting_time_up(self):
        return 0

    def get_waiting_time_down(self):
        return 0


class Building:
    def __init__(self, floorCount, elevatorCount):
        self.floorCount = floorCount
        self.elevatorCount = elevatorCount
