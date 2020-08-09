package com.example.demo.controller;

import com.example.demo.entities.Trainer;
import com.example.demo.service.TrainerService;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class TrainerController {

    @Autowired
    TrainerService trainerService;

    @RequestMapping(value = "inserttrainer.html", method = RequestMethod.GET)
    public String insertTrainer(ModelMap mm) {
        Trainer trainer = new Trainer();
        mm.addAttribute("trainer", trainer);
        return "inserttrainer";
    }

    @RequestMapping(value = "doinserttrainer.html", method = RequestMethod.POST)
    public String doinsertTrainer(ModelMap mm, @ModelAttribute("trainer") Trainer trainer) {
        trainerService.insert(trainer);
        return "redirect:/alltrainers.html";
    }

    @RequestMapping(value = "alltrainers.html", method = RequestMethod.GET)
    public String allTrainers(ModelMap mm) {
        List<Trainer> tl = trainerService.getAll();
        mm.put("list", tl);
        return "alltrainers";
    }

    @RequestMapping(value = "updatetrainer/{id}.html", method = RequestMethod.GET)
    public String updateTrainer(ModelMap mm, @PathVariable int id) {
        Trainer trainerbefore = trainerService.getById(id);
        Trainer trainerafter = new Trainer();
        mm.addAttribute("trainerafter", trainerafter);
        mm.addAttribute("trainerbefore", trainerbefore);
        return "updatetrainer";
    }

    @RequestMapping(value = "updatetrainer/doupdatetrainer.html", method = RequestMethod.POST)
    public String doupdateTrainer(ModelMap mm, @ModelAttribute("trainerafter") Trainer newtrainer) {
        trainerService.update(newtrainer);
        return "redirect:/alltrainers.html";
    }

    @RequestMapping(value = "deletetrainer/{id}.html", method = RequestMethod.GET)
    public String deleteTrainer(ModelMap mm, @PathVariable int id) {
        trainerService.delete(id);
        return "redirect:/alltrainers.html";
    }

}
