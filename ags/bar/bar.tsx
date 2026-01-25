import app from "ags/gtk4/app"
import { Astal, Gtk } from "ags/gtk4"
import { Clock } from "./widgets/Clock"

app.start({
    css: "./style.css",
    main() {
        return <window 
            name="clock-island"
            className="Island"
            // Notice: We ONLY anchor to TOP. No Left or Right!
            anchor={Astal.WindowAnchor.TOP}
            exclusivity={Astal.Exclusivity.EXCLUSIVE}
            visible>
            
            <box className="island-content">
                <Clock />
            </box>
        </window>
    }
})
