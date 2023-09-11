package com.example.controller;

import com.example.model.Comment;
import com.example.model.DailyPic;
import com.example.repo.CommentRepo;
import com.example.repo.PicRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import java.time.ZoneId;
import java.time.ZonedDateTime;
import java.util.Optional;

@Controller
public class CommentController {

    private final CommentRepo commentRepository;
    private final PicRepo pictureRepository;


    public CommentController(CommentRepo commentRepository, PicRepo pictureRepository) {
        this.commentRepository = commentRepository;
        this.pictureRepository = pictureRepository;
    }


    @GetMapping(value = {"/","/{c}"})
    public String home(Model model, @PathVariable(required = false) Integer c) {
        if(c != null){
            commentRepository.updateLike(c);
        }

        model.addAttribute("comment", new Comment());
        ZonedDateTime tz = ZonedDateTime.now(ZoneId.of("America/New_York"));
        Optional<DailyPic> optionalPicture = pictureRepository.find(tz.toLocalDate());
        model.addAttribute("picture", optionalPicture.isPresent() ? optionalPicture.get() : new DailyPic());

        return "view";
    }

    @PostMapping
    public String save(Comment comment) {
        commentRepository.save(comment);
        return "redirect:/";
    }
}
