package travel.project.domain;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import lombok.Data;

@Data
public class KakaoProfile {


	public Long id; //아이디
	public String connected_at;
	public Properties properties;
	public KakaoAccount kakao_account;
    public String synched_at;


	    @Data
	    public class Properties{

	    	public String nickname; //닉네임
	    	public String profile_image; //프로필 이미지
	    	public String thumbnail_image;
	    }

	    @JsonIgnoreProperties(ignoreUnknown = true)
	    @Data
	    public class KakaoAccount{
	    	public Boolean profile_nickname_needs_agreement;
	    	public Boolean profile_image_needs_agreement;
	    	public Profile profile;
	    	public Boolean name_needs_agreement;
	    	public String name; //이름
	    	public Boolean has_email;
	    	public Boolean email_needs_agreement;
	    	public Boolean is_email_valid;
	    	public Boolean is_email_verified;
	    	public String email; //이메일
	    	public Boolean has_phone_number;
	    	public Boolean phone_number_needs_agreement;
	    	public Boolean has_age_range;
	    	public Boolean age_range_needs_agreement;
	    	public Boolean has_birthyear;
    	    public Boolean birthyear_needs_agreement;
    	    public Boolean has_birthday;
    	    public Boolean birthday_needs_agreement;
    	    public Boolean has_gender;
    	    public Boolean gender_needs_agreement;



    	    @Data
            public class Profile {

    	    	public String nickname;
    	    	public String thumbnail_image_url;
    	    	public String profile_image_url;
    	    	public Boolean is_default_image;
    	    	public Boolean is_default_nickname;


    	    }


	    }



}
