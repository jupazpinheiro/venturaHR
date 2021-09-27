package br.edu.infnet.repository;

import br.edu.infnet.domain.Vaga;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface VagaRepository extends CrudRepository<Vaga, Integer> {

    List<Vaga> findByUsuarioId(Integer usuarioId);
    List<Vaga> findByCargoContainingIgnoreCase(String busca);
    List<Vaga> findAll();

}
