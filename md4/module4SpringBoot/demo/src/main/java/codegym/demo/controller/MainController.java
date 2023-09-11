package codegym.demo.controller;


import codegym.demo.entity.Product;
import codegym.demo.entity.Type;
import codegym.demo.service.ProductService;
import codegym.demo.service.TypeService;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.validation.Valid;
import java.util.Optional;

@Controller
public class MainController {

    final TypeService typeService;
    final ProductService productService;

    public  MainController(TypeService typeService, ProductService productService) {
        this.typeService = typeService;
        this.productService = productService;
    }

    @GetMapping("/")
    public String showDisplay(Model model,
                              @RequestParam("page") Optional<Integer> page){
        int currentPage = page.orElse(1);
        int pageSize = 5;
        Pageable pageable = PageRequest.of(currentPage - 1, pageSize, Sort.by("productId"));

        model.addAttribute("types",typeService.findAll());
        model.addAttribute("products",productService.findAll(pageable));
        return "view/list";
    }

    @GetMapping("/create")
    public String create(Model model) {
        model.addAttribute("types",typeService.findAll());
        model.addAttribute("product",new Product());
        return "view/create";
    }

    @PostMapping("/create")
    public String save(@Valid @ModelAttribute("product") Product product,
                       BindingResult result,
                       Model model,
                       RedirectAttributes attributes) {
//        ObjectValidate validate = new ObjectValidate();
//        validate.validate(product,result);
        if (result.hasErrors()){
            model.addAttribute("types",typeService.findAll());
            model.addAttribute("error",result);
            if (product.getType() == null){
                product.setType(new Type());
            }
            return "view/create";
        }
        productService.create(product);
        attributes.addFlashAttribute("message","create successfully!");
        return "redirect:/";
    }



    @GetMapping("/delete")
    public String delete(@RequestParam("id") Integer id,
                         RedirectAttributes attributes){
        productService.delete(id);
        attributes.addFlashAttribute("message","delete successfully!");
        return "redirect:/";
    }

    @GetMapping("/search")
    public String search(@RequestParam(value = "searchPrice", defaultValue = "0") Long price,
                         @RequestParam(value = "searchName", defaultValue = "") String name,
                         @RequestParam(value = "typeId", defaultValue = "0") Integer typeId,
                         Model model,
                         @RequestParam("page") Optional<Integer> page){
        int currentPage = page.orElse(1);
        int pageSize = 5;
        Pageable pageable = PageRequest.of(currentPage - 1, pageSize, Sort.by("productId"));
        Page<Product> productPage = productService.findByProductNameAndPriceAndType(name, price, typeId, pageable);

//        model.addAttribute("searchPrice",price);
//        model.addAttribute("searchName",name);
//        model.addAttribute("searchType",typeService.findById(typeId));

        model.addAttribute("types",typeService.findAll());
        model.addAttribute("products",productPage);
        return "/view/list";
    }

}
