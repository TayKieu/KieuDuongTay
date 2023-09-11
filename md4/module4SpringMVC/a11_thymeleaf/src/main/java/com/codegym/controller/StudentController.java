package com.codegym.controller;

import com.codegym.model.Student;
import com.codegym.service.IStudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;

@Controller
@RequestMapping("/student")
public class StudentController {
    @Autowired
    private IStudentService studentService;

//    @GetMapping("/student")
//    public String showList(Model model){
//        List<Student> studentList = studentService.findAll();
//        model.addAttribute("studentList",studentList);
//        return "list";
//    }
    @ModelAttribute("languages")
    public String[] getLanguages(){
        return new String[]{"PHP","JS","Java","SQL"};
    }
    @GetMapping("")
    public ModelAndView showList(){
        List<Student> studentList = studentService.findAll();
        ModelAndView modelAndView = new ModelAndView("list");
        modelAndView.addObject("studentList",studentList);
        return modelAndView ;
    }
    @GetMapping("/create")
    public String showFormCreate(Model model){
        model.addAttribute("student",new Student());
        return "create";
    }
    @PostMapping("/create")
    public String save(@ModelAttribute Student student,
                       Model model,
                       RedirectAttributes redirectAttributes){
        studentService.save(student);
        redirectAttributes.addFlashAttribute("mess","them moi thanh cong");
        return "redirect:/student";
    }
    @GetMapping("/detail")
    public String showDetail1(@RequestParam(required = false,defaultValue = "1") int id, Model model){
        Student student = studentService.findById(id);
        model.addAttribute("student", student);
        return "detail";
    }
    // pathVariable
//    @GetMapping("/detail/{id}")
    // có thể regex
    @GetMapping("/detail/{id}")
    public String showDetail2(@PathVariable int id, Model model){
        Student student = studentService.findById(id);
        model.addAttribute("student", student);
        return "detail";
    }
}
