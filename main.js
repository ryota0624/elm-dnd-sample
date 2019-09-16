import {Elm} from "./Main.elm"
Elm.Main.init({node: document.getElementById("app")})

function render(id1, id2) {
    const middleLabel = LeaderLine.captionLabel({text: 'MIDDLE'})
    const line = new LeaderLine(
        document.getElementById(id1),
        LeaderLine.pointAnchor(document.getElementById(id2), {x: 20}),
        {
            // endLabel: middleLabel
        }
    )
    // line.remove();
}

render("d-1", "d-2")
// render("d-3", "d-4")
render("d-5", "d-6")
render("d-7", "d-10")
render("d-9", "d-4")
// render("d-3", "d-8")
