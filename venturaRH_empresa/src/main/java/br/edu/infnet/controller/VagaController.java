package br.edu.infnet.controller;

import br.edu.infnet.domain.Criterio;
import br.edu.infnet.domain.Vaga;
import br.edu.infnet.repository.VagaRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController //controller com caminho http
@RequestMapping(path = {"/vagas"})
public class VagaController {

    @Autowired
    private VagaRepository vagaRepository;

    //junta a requisição para passar a entidade na tela
    @PostMapping
    public ResponseEntity postarVaga (@RequestBody Vaga vaga){
        ResponseEntity resposta = ResponseEntity.badRequest().build();

        List<Criterio> criterioList = vaga.getCriterioList();
        if (criterioList != null && !criterioList.isEmpty()){
            for (Criterio criterio : criterioList){
                criterio.setVaga(vaga);
            }
            Vaga registrada = vagaRepository.save(vaga);
            resposta = ResponseEntity.status(HttpStatus.CREATED).body(registrada);

        }

        return resposta;
    }

    @GetMapping(path = "/usuario/{usuarioId}")
    public ResponseEntity listaPorUsuarioId(@PathVariable Integer usuarioId){

        List<Vaga> lista = vagaRepository.findByUsuarioId(usuarioId);

        return ResponseEntity.ok().body(lista);
    }

    @GetMapping(path = "/cargo/{busca}")
    public ResponseEntity listaPorCargo(@PathVariable String busca){
        ResponseEntity resposta = ResponseEntity.notFound().build();
        try{
            List<Vaga> lista = vagaRepository.findByCargoContainingIgnoreCase(busca);
            if(!lista.isEmpty()){
                resposta = ResponseEntity.ok().body(lista);

            }
        }catch(Exception e){

        }
        return  resposta;
    }

    @GetMapping(path = "/")
    public ResponseEntity allVagas(){
        List<Vaga> vagas = vagaRepository.findAll();
        return ResponseEntity.ok().body(vagas);
    }
}
