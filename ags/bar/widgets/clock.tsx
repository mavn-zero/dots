import { Gtk } from "ags/gtk4"
import { Variable } from "ags/variable"
import { createPoll } from "ags/time"

export function Clock() {
    const time = createPoll("", 1000, "date '+%H:%M'")
    const isExpanded = Variable(false) // This tracks if the island is 'open'

    return (
        <box className="island-container">
            <eventbox 
                onHover={() => isExpanded.set(true)}
                onHoverLost={() => isExpanded.set(false)}
            >
                <box spacing={8}>
                    {/* The basic time pill */}
                    <label className="clock-time" label={time.bind()} />

                    {/* The 'Dynamic' part that reveals on hover */}
                    <revealer 
                        revealChild={isExpanded.bind()}
                        transitionType={Gtk.RevealerTransitionType.SLIDE_RIGHT}
                    >
                        <label className="upcoming-task" label=" | Next: Coffee ☕" />
                    </revealer>
                </box>
            </eventbox>
        </box>
    )
}
