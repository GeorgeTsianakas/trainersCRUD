package com.example.demo.service;

import com.example.demo.entities.Trainer;
import com.example.demo.repositories.TrainerRepository;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class TrainerService {

    @Autowired
    TrainerRepository trainerRepo;

    public void insert(Trainer trainer) {
        trainerRepo.save(trainer);
    }

    public List<Trainer> getAll() {
        return trainerRepo.findAll();
    }

    public Trainer getById(int id) {
        Trainer trainer = trainerRepo.findById(id).get();
        return trainer;
    }

    public void update(Trainer trainer) {
        trainerRepo.save(trainer);
    }

    public void delete(int id) {
        trainerRepo.deleteById(id);
    }

}
