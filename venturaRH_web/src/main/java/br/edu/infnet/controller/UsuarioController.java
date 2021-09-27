package br.edu.infnet.controller;

import br.edu.infnet.domain.Usuario;
import br.edu.infnet.service.UsuarioService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class UsuarioController {

    @Autowired
    private UsuarioService usuarioService;

    @GetMapping(value = "/usuario")
    public String screenUsuario() {

        return "/usuario/create";
    }

    @PostMapping(value = "/usuario/create")
    public String createUsuario(Model model, Usuario usuario) {
        usuarioService.createUsuario(usuario);
        model.addAttribute("usuario", usuario);
        String inbox = null;

        if (usuario.getTipo() == Usuario.ADMINISTRADOR ||
                usuario.getTipo() == Usuario.CANDIDATO ||
                usuario.getTipo() == Usuario.EMPRESA) {

            inbox = "redirect:/login";


        }
        return inbox;
    }
}
