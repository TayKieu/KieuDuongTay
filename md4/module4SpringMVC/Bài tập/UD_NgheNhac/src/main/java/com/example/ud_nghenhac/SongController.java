package com.example.ud_nghenhac;

import com.example.model.Song;
import com.example.service.IMusicAppService;
import com.example.service.IMusicAppServiceImpl;
import com.sun.org.apache.xpath.internal.operations.Mod;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;

@Controller
@RequestMapping("/song")
public class SongController {
    @Autowired
            private IMusicAppService musicAppService;

    @GetMapping("")
    private String showList(Model model){
        List<Song> songList= musicAppService.findAll();
        model.addAttribute("ListSong",songList);
        return "list";
    }
    @GetMapping("/create")
    private String showCreate(Model model){
        model.addAttribute("song",new Song());
        return "create";
    }
    @PostMapping("/create")
    private String save(@ModelAttribute("song") Song song, Model model, RedirectAttributes redirectAttributes){
        musicAppService.save(song);
        redirectAttributes.addFlashAttribute("mess","them moi thanh cong");
        return "redirect:/song";
    }
    @PostMapping("/{id}/delete")
    private String delete(@PathVariable("id")int id, RedirectAttributes redirectAttributes){
        musicAppService.delete(id);
        redirectAttributes.addFlashAttribute("message","Xoa thanh cong");
        return "redirect:/";
    }
    @GetMapping("/{id}/view")
    public String view(@PathVariable("id") int id, Model model) {
        model.addAttribute("song", musicAppService.findOneById(id));
        return "/view";
    }
//    @GetMapping("/{id}/edit")
//    public String showEdit(@PathVariable("id") int id, Model model){
//
//    }
}
