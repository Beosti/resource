extends Resource

# List of all achievements
# One achievement: Title, description, state (done, discovered, undiscovered), category
class_name Achievement

@export var title = "";
@export var ID = "";
@export var flavorText = "";
@export var description = "";
enum State {DONE, DISCOVERED, UNDISCOVERED}
@export var state: State = State.UNDISCOVERED
@export var icon: Texture2D;
