package br.edu.infnet.controller;

import br.edu.infnet.domain.Usuario;
import br.edu.infnet.domain.Vaga;
import br.edu.infnet.service.UsuarioService;
import br.edu.infnet.service.VagaService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@SessionAttributes("usuario")
public class LoginController {

    @Autowired
    private UsuarioService usuarioService;

    @Autowired
    private VagaService vagaService;

    @GetMapping(value = "/")
    public String index() {

        return "/index";
    }

    @GetMapping(value = "/login")
    public String screen_login() {

        return "/login";
    }

    @GetMapping(value = "/logout")
    public String logout(HttpSession session, SessionStatus status) {
        status.setComplete();
        session.removeAttribute("usuario");

        return "redirect:/login";
    }

    @PostMapping(value = "/login")
    public String login(Model model, @RequestParam String email, @RequestParam String senha) {
        Usuario usuario = usuarioService.getByEmail(email);

        if (usuario != null && email.equals(usuario.getEmail()) && senha.equals(usuario.getSenha())) {
            model.addAttribute("usuario", usuario);

            String inbox = null;

            if (usuario.getTipo() == Usuario.ADMINISTRADOR) {
                inbox = "/administrador/index";

            } else if (usuario.getTipo() == Usuario.CANDIDATO) {
                inbox = "/candidato/index";

            } else {
                List<Vaga> vagas = vagaService.listaVaga(usuario.getId());
                model.addAttribute("vagas", vagas);
                inbox = "/empresa/index";

            }

            return inbox;

        } else {
            model.addAttribute("msg", "Usuário não encontrado" + email);
        }

        return "/login";
    }
}
