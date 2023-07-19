package com.example.productthymleaf;

import com.example.model.Product;
import com.example.service.IProductService;
import com.example.service.IProductServiceImpl;
import com.sun.org.apache.xpath.internal.operations.Mod;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.ArrayList;
import java.util.List;

@Controller
public class ProductController {
    private final IProductService service = new IProductServiceImpl();
    @GetMapping("/")
    public String index(Model model){
        List<Product> products = service.findAll();
        model.addAttribute("products",products);
        return "index";
    }

    @PostMapping("/{id}/delete")
    public String delete(@PathVariable("id") int id, RedirectAttributes redirect){
        service.delete(id);
        redirect.addFlashAttribute("success", "Removed customer successfully!");
        return "redirect:/";
    }
    @GetMapping("/{id}/view")
    public String view(@PathVariable int id, Model model) {
        model.addAttribute("product", service.findById(id));
        return "/view";
    }
    @PostMapping("/save")
    public String save(Product product) {
        product.setId((int) (Math.random() * 10000));
        service.save(product);
        return "redirect:/";
    }
    @GetMapping("/create")
    public String create(Model model){
        model.addAttribute("product", new Product());
        return "/create";
    }

}
