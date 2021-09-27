package br.edu.infnet.controller;

import br.edu.infnet.domain.Criterio;
import br.edu.infnet.domain.Usuario;
import br.edu.infnet.domain.Vaga;
import br.edu.infnet.service.VagaService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

@Controller
public class VagaController {

    @Autowired
    private VagaService vagaService;

    //cria intenção de vaga
    @GetMapping(value="/empresa/addVaga")
    public String telaVaga(){
        return "/empresa/addVaga";
    }

    //cria a lógica para adicionar a vaga com distintos criterios
    @PostMapping(value = "/empresa/addVaga")
    public ModelAndView openVaga(Vaga vaga, HttpServletRequest request){

        //recursividade para addcriterio sem voltar pro index
        ModelAndView resposta = new ModelAndView("/empresa/addVaga");
        HttpSession session = request.getSession();
        //diferença em criterios
        session.setAttribute("vaga", vaga);
        return resposta;

    }
    //sempre que colocar dados no sistema é Post
    @PostMapping(value = "/empresa/addCriterio")
    public ModelAndView addCriterio(Criterio criterio, HttpServletRequest request){

        //recursividade para addcriterio sem limites
        ModelAndView resposta = new ModelAndView("/empresa/addVaga");
        HttpSession session = request.getSession();
        //recepção de OtM para criterios-varios possíveis-
        List criterios = (List) session.getAttribute("criterios");
        if(criterios == null){
            criterios = new ArrayList<>();
        }
        criterios.add(criterio);
        session.setAttribute("criterios", criterios);

        return resposta;

    }

    //método para publicar a vaga
    @PostMapping(value = "/empresa/postarVaga")
    public String postarVaga(HttpServletRequest request, Model model){
        HttpSession session = request.getSession();
        Usuario usuario = (Usuario) session.getAttribute("usuario");
        Vaga vaga = (Vaga) session.getAttribute("vaga");
        List criterios = (List) session.getAttribute("criterios");
        vaga.setCriterioList(criterios);
        vagaService.postVaga(vaga);
        List <Vaga> vagas = vagaService.listaVaga(usuario.getId());
        model.addAttribute("vagas", vagas);

        //limpeza da sessão para publicar mais de uma vaga
        session.removeAttribute("vaga");
        session.removeAttribute("criterios");
        return "/empresa/index";

    }

    //todas as vagas
    @GetMapping(value="/candidato/index")
    public ModelAndView allVagas(HttpServletRequest request){
        //recursividade para addcriterio sem voltar pro index
        ModelAndView resposta = new ModelAndView("/candidato/index");
        HttpSession session = request.getSession();
        //diferença em criterios
        List <Vaga> vagas = vagaService.allVagas();
        session.setAttribute("vagas", vagas);
        return resposta;
    }


}
