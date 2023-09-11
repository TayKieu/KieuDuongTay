package codegym.demo.entity;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

@Entity
@Getter @Setter
public class Product {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    Integer productId;

    @Size(min = 5, max = 50, message = "{name.size}")
    @NotBlank(message = "{notempty}")
    String productName;

    String status;

    @Min(value = 100000, message = "Min is 100000")
    @NotNull(message = "{notempty}")
    Long price;

    @ManyToOne
    @JoinColumn(name = "typeId", referencedColumnName = "typeId")
    Type type;
}
