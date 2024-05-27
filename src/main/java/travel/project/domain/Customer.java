package travel.project.domain;

import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.Pattern;
import jakarta.validation.constraints.Size;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@NoArgsConstructor
@AllArgsConstructor
@Getter @Setter
public class Customer {
    @NotEmpty(message = "아이디는 필수 입니다")
    @Size(max = 20, min = 5, message = "아이디는 5 ~ 20 글자사이여야 합니다")
    private String customerId;
    private String password;
    private String confirmPassword;
    @NotEmpty(message = "아이디는 필수 입니다")
    @Pattern(regexp = "^[가-힣a-zA-Z]+$", message = "이름엔 영어와 한글만 가능합니다")
    @Size(max = 25, message = "이름은 최대 25글자 까지 가능합니다")
    private String name;
    @Email(message = "유효하지 않은 이메일 형식입니다")
    @NotEmpty(message = "이메일은 필수입니다")
    private String email;
    @Pattern(regexp = "^010[0-9]{8}$", message = "휴대폰 번호는 010으로 시작하고 총 11자리의 숫자여야 합니다.")
    private String phoneNumber;
    @NotEmpty(message = "주소를 입력하세요")
    @Size(min = 10, max = 255, message = "주소는 10 ~ 255자가 허용됩니다")
    private String address;

    public Customer(String customerId, String password, String name, String email, String phoneNumber, String address) {
        this.customerId = customerId;
        this.password = password;
        this.name = name;
        this.email = email;
        this.phoneNumber = phoneNumber;
        this.address = address;
    }
}
