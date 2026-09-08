const botones = document.querySelectorAll(".boton-panel");
const edit = document.querySelectorAll('.edit')

let botonActivo = null;
let panelActivo = null;

function cerrarPanel() {

    if (!panelActivo) return;

    panelActivo.classList.remove("activo");

    // botonActivo.classList.remove("activo");

    // botonActivo.dataset.tooltip =
    //     botonActivo.dataset.tooltipAbrir;

    if (botonActivo) {
        botonActivo.classList.remove("activo");
        botonActivo.dataset.tooltip = botonActivo.dataset.tooltipAbrir;
    }

    panelActivo = null;
    botonActivo = null;

}

function abrirPanel(boton, panelId) {
    const idPanel = boton ? boton.dataset.panel : panelId;
    const panel = document.getElementById(idPanel);

    if (!panel) return;

    panel.classList.add("activo");

    if (boton) {
        boton.classList.add("activo");
        boton.dataset.tooltip = boton.dataset.tooltipCerrar;
        botonActivo = boton;
    }

    panelActivo = panel;
}

// Evento para los botones de la barra lateral
botones.forEach(boton => {
    boton.addEventListener("click", () => {
        if (boton === botonActivo) {
            cerrarPanel();
            return;
        }

        cerrarPanel();
        abrirPanel(boton);
    });
});

// Detectar al cargar la página si el panel del formulario ya está abierto por el parámetro GET
document.addEventListener("DOMContentLoaded", () => {
    const panelFormulario = document.getElementById("formulario");

    // Si PHP le puso la clase activo
    if (panelFormulario && panelFormulario.classList.contains("activo")) {
        const botonFormulario = document.querySelector('.boton-panel[data-panel="formulario"]');

        panelActivo = panelFormulario;
        if (botonFormulario) {
            botonFormulario.classList.add("activo");
            botonFormulario.dataset.tooltip = botonFormulario.dataset.tooltipCerrar;
            botonActivo = botonFormulario;
        }
    }
});

// Cerrar panel con tecla Escape
document.addEventListener("keydown", (e) => {
    if (e.key === "Escape") {
        cerrarPanel();
    }
});