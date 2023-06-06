/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller;

import config.*;
//import org.apache.log4j.Logger;
import java.io.IOException;
import java.io.InputStream;
import java.sql.ResultSet;
import java.sql.*;
import java.util.ArrayList;
import java.util.Base64;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import jdk.jpackage.internal.IOUtils;
import model.Course;
import model.UserDetails;
import model.dbModel;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.*;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;


public class mycontroller {
//    private static final Logger logger = Logger.getLogger(Mycontroller.class);
   connextion con =new connextion() ;
   JdbcTemplate jdbctemp= new JdbcTemplate (con.Connect());
    ModelAndView mv =new ModelAndView ();
    JdbcTemplate jdbcTemplate = new JdbcTemplate(con.Connect());
    List<Map<String, Object>> cartItems = new ArrayList<>();
    double totalPrice = 0;
    List Datas;
    List userList;
    List currentUserList;
    List homeProductList;
    List viewProdById;
    List products;
   
    

    
    
      @RequestMapping(value="adminIndex.htm")
public ModelAndView listProductsIndex() {
    String sql = "SELECT * FROM course";
    List<Map<String, Object>> allProdAtIndexPage = this.jdbctemp.queryForList(sql);

    for (Map<String, Object> product : allProdAtIndexPage) {
        byte[] imageBytes = (byte[]) product.get("image");
        String base64Image = Base64.getEncoder().encodeToString(imageBytes);
        product.put("imageBase64", base64Image);
    }

    ModelAndView mv = new ModelAndView();
    mv.addObject("ProductList", allProdAtIndexPage);
    mv.setViewName("adminIndex");
    return mv;
}

  @RequestMapping(value="studentview.htm")
public ModelAndView listProducts() {
    String sql = "SELECT * FROM course";
    List<Map<String, Object>> products = this.jdbctemp.queryForList(sql);

    for (Map<String, Object> product : products) {
        byte[] imageBytes = (byte[]) product.get("image");
        String base64Image = Base64.getEncoder().encodeToString(imageBytes);
        product.put("imageBase64", base64Image);
    }

    ModelAndView mv = new ModelAndView();
    mv.addObject("ProductList", products);
    mv.setViewName("studentview");
    return mv;
}
//===========================================================================/
//============================================================================

@RequestMapping(value="home.htm")
public ModelAndView listProductsInde() {
    String sql = "SELECT * FROM marks";
    List<Map<String, Object>> allProdAtIndexPag = this.jdbctemp.queryForList(sql);

    for (Map<String, Object> product : allProdAtIndexPag) {
        byte[] imageBytes = (byte[]) product.get("image");
        String base64Image = Base64.getEncoder().encodeToString(imageBytes);
        product.put("imageBase64", base64Image);
    }

    ModelAndView mv = new ModelAndView();
    mv.addObject("ProductLis", allProdAtIndexPag);
    mv.setViewName("home");
    return mv;
}



//cris select ==================================================================================================================

@RequestMapping(value="viewmarks.htm")
public ModelAndView ProductList() {
    String sql = "SELECT * FROM result";
    List<Map<String, Object>> allProdAtIndexPag = this.jdbctemp.queryForList(sql);

    for (Map<String, Object> product : allProdAtIndexPag) {
        byte[] imageBytes = (byte[]) product.get("evidence");
        String base64Image = Base64.getEncoder().encodeToString(imageBytes);
        product.put("imageBase64", base64Image);
    }

    ModelAndView mv = new ModelAndView();
    mv.addObject("ProductList", allProdAtIndexPag);
    mv.setViewName("viewmarks");
    return mv;
}







//second      cris================================================================================================================

@RequestMapping(value="viewmarkstostudent.htm")
public ModelAndView ProductLists() {
    String sql = "SELECT * FROM result";
    List<Map<String, Object>> allProdAtIndexPag = this.jdbctemp.queryForList(sql);

    for (Map<String, Object> product : allProdAtIndexPag) {
        byte[] imageBytes = (byte[]) product.get("evidence");
        String base64Image = Base64.getEncoder().encodeToString(imageBytes);
        product.put("imageBase64", base64Image);
    }

    ModelAndView mv = new ModelAndView();
    mv.addObject("ProductLists", allProdAtIndexPag);
    mv.setViewName("viewmarkstostudent");
    return mv;
}



/// thurd chris                                              edit marks =============================---------------====


@RequestMapping(value = "addevidence.htm", method = RequestMethod.GET)
public ModelAndView Addevidence(@RequestParam("eid") int id) {
    ModelAndView mv = new ModelAndView();
    
    String sql = "SELECT * FROM result WHERE id = ?";
    List<Map<String, Object>> data = this.jdbctemp.queryForList(sql, id);
    
    mv.addObject("EditProducts", data);
    mv.setViewName("addevidence");
    
    return mv;
}

   
   @RequestMapping(value = "addevidence.htm", method = RequestMethod.POST)
public ModelAndView Addevidence(dbModel product) {
       byte[] evidence = product.getEvidence();
    if (evidence == null) {
        // Handle the case when evidence is null (e.g., return an error message)
        // You can redirect the user to the form page or display an error message
        return new ModelAndView("redirect:viewmarkstostudent.htm");
    }
    
    String sql = "UPDATE result SET evidence=? WHERE id=?";
    
    this.jdbctemp.update(sql, product.getEvidence(), product.getId());

    return new ModelAndView("redirect:viewmarkstostudent.htm");
}







   
   
     @RequestMapping(value="insertresult.htm")
   public ModelAndView sheet(){
       String sql = "SELECT coursename, id, NULL AS A\n" +
"FROM course\n" +
"UNION ALL\n" +
"SELECT NULL AS coursename, NULL AS id, A\n" +
"FROM sheet1;";
    List<Map<String, Object>> products = this.jdbctemp.queryForList(sql);
 

    ModelAndView mv = new ModelAndView();
    mv.addObject("ProductList", products);
    mv.setViewName("insertresult");
    return mv;
    }
   
   
   /////////// insert marks/////////////////////
 @RequestMapping(value="insertresult.htm", method=RequestMethod.POST)
    public ModelAndView Addmark(dbModel a){
        String sql ="INSERT INTO `result`(`regno`, `coursename`, `marks`, `evidence`)value (?,?,?,?);";
        this.jdbctemp.update(sql, a.getRegno(),a.getCoursename(), a.getMarks(),a.getEvidence());
        return new ModelAndView("redirect:insertresult.htm");
}
   
     @RequestMapping(value="allUsers.htm")
   public ModelAndView Users(){
        String sql="select * from users";
    userList=this.jdbctemp.queryForList(sql);
    mv.addObject("Users",userList);
    mv.setViewName("allUsers");
    return mv;
    }

   
   
   
   
   
   
   
   
   
   
      @RequestMapping(value="registerUser.htm",method=RequestMethod.GET)
   public ModelAndView AddUser(){
   mv.addObject(new UserDetails());
   mv.setViewName("registerUser");
   
   return mv;        
   
   
   }
   
   
   
        @RequestMapping(value="registerUser.htm",method=RequestMethod.POST)
   public ModelAndView AddUser(UserDetails u){
   String sql ="insert into users (username,password,email,role)value(?,?,?,?)";
   this.jdbctemp.update(sql,u.getUsername(),u.getPassword(),u.getEmail(),u.getRole());
   
   return new ModelAndView("redirect:student.htm") ;        
   
   
   }
   //try 
   
  
   
   
       @RequestMapping(value="student.htm")
   public ModelAndView UserLoging(){
        String sql="select * from users";
   currentUserList=this.jdbctemp.queryForList(sql);
    mv.addObject("currentUser",currentUserList);
    mv.setViewName("student");
    return mv;
    } 
   
   
      

   


   

   
   
    
//    @RequestMapping(value="register.htm",method=RequestMethod.GET)
//   public ModelAndView AddProduct(){
//   mv.addObject(new dbModel());
//   mv.setViewName("register");
//   
//   return mv;        
//     
//   }
         @RequestMapping("HOME.htm")
   public ModelAndView HOME(){
   mv.addObject(new dbModel());
   mv.setViewName("HOME");
   
   return mv;

   }
    
   @RequestMapping("hod.htm")
   public ModelAndView hod(){
   mv.addObject(new dbModel());
   mv.setViewName("hod");
   
   return mv;

   }
     @RequestMapping("lecture.htm")
   public ModelAndView lecture(){
   mv.addObject(new dbModel());
   mv.setViewName("lecture");
   
   return mv;

   }
        @RequestMapping("lecview.htm")
   public ModelAndView lecview(){
   mv.addObject(new dbModel());
   mv.setViewName("lecview");
   
   return mv;

   }
   
    @RequestMapping(value="register.htm", method=RequestMethod.GET)
    public ModelAndView AddS(){
    mv.addObject(new dbModel());
    mv.setViewName("register");
     return mv;
     
    }
    
     @RequestMapping(value="register.htm", method=RequestMethod.POST)
    public ModelAndView AddS(dbModel a){
        String sql ="insert into course (coursename,coursecode,credit,image) values(?,?,?,?)";
        this.jdbctemp.update(sql, a.getCoursename(), a.getCoursecode(),a.getCredit(),a.getImage());
        return new ModelAndView("redirect:adminIndex.htm");
}
// @RequestMapping(value = "register.htm", method = RequestMethod.POST)  
//
//public ModelAndView AddProduct(@ModelAttribute dbModel p, @RequestParam(value = "image", required = false) MultipartFile image) {
//    if (image != null && !image.isEmpty()) {
//        try {
//            byte[] imageBytes = image.getBytes();
//            p.setImage(imageBytes);
//        } catch (IOException e) {
//            e.printStackTrace();
//        }
//    } else {
//        // Set a default image
//        byte[] defaultImage = getDefaultImage(); 
//        p.setImage(defaultImage);
//    }
//
//        String sql = "INSERT into course (coursename, coursecode, credit, image) VALUES (?, ?, ?, ?)";
//
//    this.jdbctemp.update(sql, p.getCoursename(), p.getCoursecode(), p.getCredit(), p.getImage());
//
//    return new ModelAndView("redirect:HOME.htm");
//}

//public ModelAndView AddProduct(@ModelAttribute Course y, @RequestParam(value = "image", required = false) MultipartFile image) {
//    if (image != null && !image.isEmpty()) {
//        try {
//            byte[] imageBytes = image.getBytes();
//            y.setImage(imageBytes);
//        } catch (IOException e) {
//            e.printStackTrace();
//        }
//    } else {
//        // Set a default image
//        byte[] defaultImage = getDefaultImage(); 
//        y.setImage(defaultImage);
//    }
//
//    String sql = "INSERT into marks (reg,coursecode, coursename, title,marks, image) VALUES (?, ?, ?, ?,?,?)";
//        this.jdbctemp.update(sql, y.getReg(),y.getCoursecode(), y.getCoursename(), y.getTitle(),y.getMarks(), y.getImage());
//
//
//    return new ModelAndView("redirect:index.htm");
//}
//DFGHJKLKJUYTREERTYUIKLIUYTRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRR
//private byte[] getDefaultImage() {
//    String sql = "SELECT image FROM default_images WHERE id = ?";
//    byte[] defaultImage = null;
//    try {
//        defaultImage = this.jdbctemp.queryForObject(sql, new Object[]{1}, byte[].class);
//    } catch (EmptyResultDataAccessException e) {
//        e.printStackTrace();
//    }
//    return defaultImage;
//}


   
   
//     @RequestMapping(value="prod_details.htm",method=RequestMethod.GET)
//   public ModelAndView prodById( @RequestParam("id")int id){
//   String sql ="select * from products where id='"+id+"'";
//  Datas=this.jdbctemp.queryForList(sql);
//   mv.addObject("getProById",viewProdById);
//   mv.setViewName("prod_details");
//   return mv;        
//   
//   
//   }
   
   
    @RequestMapping(value="edit.htm",method=RequestMethod.GET)
   public ModelAndView Edit( @RequestParam("eid")int id){
   String sql ="select * from course where id='"+id+"'";
  Datas=this.jdbctemp.queryForList(sql);
   mv.addObject("EditProduct",Datas);
   mv.setViewName("edit");
   return mv;        
   
   
   }
  
   @RequestMapping(value="edit.htm",method=RequestMethod.POST)
   public ModelAndView Editing(dbModel product){
   String sql ="update course SET coursename=?,coursecode=? ,credit=?,image=?  where id =?";
   this.jdbctemp.update(sql, product.getCoursename(),product.getCoursecode(),product.getCredit(),product.getImage(),product.getId());

   
   return new ModelAndView("redirect:adminIndex.htm") ;        
   
   
   }
   
   //  EDIT STUDET =============================================================================================== ADD EVIDENCE-===============
    
  @RequestMapping(value = "editmarks.htm", method = RequestMethod.GET)
public ModelAndView Addevidences(@RequestParam("eid") int id) {
    ModelAndView mv = new ModelAndView();
    
    String sql = "SELECT * FROM result WHERE id = ?";
    List<Map<String, Object>> data = this.jdbctemp.queryForList(sql, id);
    
    mv.addObject("EditProducts", data);
    mv.setViewName("editmarks");
    
    return mv;
}

   
   @RequestMapping(value = "addevidence.htm", method = RequestMethod.POST)
public ModelAndView Addevidences(dbModel product) {
       byte[] evidence = product.getEvidence();
    if (evidence == null) {
        // Handle the case when evidence is null (e.g., return an error message)
        // You can redirect the user to the form page or display an error message
        return new ModelAndView("redirect:viewmarkstostudent.htm");
    }
    
    String sql = "UPDATE result SET coursename=?,regno=?,marks=?, WHERE id=?";
    
    this.jdbctemp.update(sql, product.getCoursename(),product.getRegno(),product.getMarks(), product.getId());

    return new ModelAndView("redirect:viewmarks.htm");
}



@RequestMapping(value="deletemarks.htm")
   public ModelAndView deletes( @RequestParam("id")int id){
  
   String sql ="delete from result where id='"+id+"'";
   this.jdbctemp.update(sql);
    return new ModelAndView("redirect:viewmarks.htm") ;
   }

       
   
   
   


   
   //
   
     
    @RequestMapping(value="delete.htm")
   public ModelAndView delete( @RequestParam("id")int id){
  
   String sql ="delete from course where id='"+id+"'";
   this.jdbctemp.update(sql);
    return new ModelAndView("redirect:adminIndex.htm") ;
   }

//=====================  STUDENT ======================
   
private boolean authenticateUser(String username, String password) {
    UserDetails user = getUserByUsername(username);

    if (user != null) {
        String storedPassword = user.getPassword();

        if (password.equals(storedPassword)) {
           
            return true;
        }
    }

  
    return false;
}

private UserDetails getUserByUsername(String username) {
    String sql = "SELECT * FROM users WHERE username = ?";
    List<UserDetails> users = jdbctemp.query(sql, new Object[]{username}, new RowMapper<UserDetails>() {
        @Override
        public UserDetails mapRow(ResultSet rs, int rowNum) throws SQLException {
            UserDetails user = new UserDetails();
            user.setId(rs.getInt("id"));
            user.setUsername(rs.getString("username"));
            user.setPassword(rs.getString("password"));
            user.setEmail(rs.getString("email"));
            user.setRole(rs.getString("role"));
            user.setCreatedAt(rs.getString("created_At"));
            // Set other user properties as needed
            return user;
        }
    });

    if (!users.isEmpty()) {
        return users.get(0);
    }

    return null;
}
// mapiing                   =================================================================== --====== mapping for student=======   
        @RequestMapping(value = "student.htm", method = RequestMethod.POST)
    public ModelAndView userLogin(@RequestParam("username") String username,
                                  @RequestParam("password") String password,
                                  HttpServletRequest request) {
        ModelAndView mv = new ModelAndView();

        //authentication
        if (authenticateUser(username, password)) {
            UserDetails user = getUserByUsername(username);
            setCurrentUser(request, user);

            mv.setViewName("redirect:viewmarkstostudent.htm"); // Redirect to home page
        } else {
            mv.addObject("error", "Invalid username or password");
            mv.setViewName("student");
        }

        return mv;
    }

    //============================================================
                 //hod
private boolean authenticateke(String username, String password) {
    UserDetails use = getkeByUsername(username);

    if (use != null) {
        String storedPassword = use.getPassword();

        if (password.equals(storedPassword)) {
           
            return true;
        }
    }

  
    return false;
}

private UserDetails getkeByUsername(String username) {
    String sql = "SELECT * FROM hod WHERE username = ?";
    List<UserDetails> use = jdbctemp.query(sql, new Object[]{username}, new RowMapper<UserDetails>() {
        @Override
        public UserDetails mapRow(ResultSet rs, int rowNum) throws SQLException {
            UserDetails us = new UserDetails();
            us.setId(rs.getInt("id"));
            us.setUsername(rs.getString("username"));
            us.setPassword(rs.getString("password"));
            us.setEmail(rs.getString("email"));
            us.setRole(rs.getString("role"));
            us.setCreatedAt(rs.getString("created_At"));
            // Set other user properties as needed
            return us;
        }
    });

    if (!use.isEmpty()) {
        return use.get(0);
    }

    return null;
}
    
        @RequestMapping(value = "hod.htm", method = RequestMethod.POST)
    public ModelAndView kehod(@RequestParam("username") String username,
                                  @RequestParam("password") String password,
                                  HttpServletRequest request) {
        ModelAndView mv = new ModelAndView();

        //authentication
        if (authenticateke(username, password)) {
            UserDetails ser = getkeByUsername(username);
            setCurrentUser(request, ser);

            mv.setViewName("marks"); // Redirect to home page
        } else {
            mv.addObject("error", "Invalid username or password");
            mv.setViewName("hod");
        }

        return mv;
    }

    //======================================================================
                           //lecture
    
    private boolean authenticatek(String username, String password) {
    UserDetails usew = getkByUsername(username);

    if (usew != null) {
        String storedPassword = usew.getPassword();

        if (password.equals(storedPassword)) {
           
            return true;
        }
    }

  
    return false;
}

private UserDetails getkByUsername(String username) {
    String sql = "SELECT * FROM lecture WHERE username = ?";
    List<UserDetails> use = jdbctemp.query(sql, new Object[]{username}, new RowMapper<UserDetails>() {
        @Override
        public UserDetails mapRow(ResultSet rs, int rowNum) throws SQLException {
            UserDetails us = new UserDetails();
            us.setId(rs.getInt("id"));
            us.setUsername(rs.getString("username"));
            us.setPassword(rs.getString("password"));
            us.setEmail(rs.getString("email"));
            us.setRole(rs.getString("role"));
            us.setCreatedAt(rs.getString("created_At"));
            // Set other user properties as needed
            return us;
        }
    });

    if (!use.isEmpty()) {
        return use.get(0);
    }

    return null;
}
    
        @RequestMapping(value = "lecture.htm", method = RequestMethod.POST)
    public ModelAndView klecture(@RequestParam("username") String username,
                                  @RequestParam("password") String password,
                                  HttpServletRequest request) {
        ModelAndView mv = new ModelAndView();

        //authentication
        if (authenticatek(username, password)) {
            UserDetails ser = getkByUsername(username);
            setCurrentUser(request, ser);

            mv.setViewName("redirect://adminIndex.htm"); // Redirect to home page
        } else {
            mv.addObject("error", "Invalid username or password");
            
            mv.setViewName("lecture");
        }

        return mv;
    }

    
    //===========================================
  private boolean isUserAuthenticated(HttpServletRequest request) {
    
        return getCurrentUser(request) != null;
    }

 
    private UserDetails getCurrentUser(HttpServletRequest request) {
        return (UserDetails) request.getSession().getAttribute("currentUser");
    }

    // the current user in the session
    private void setCurrentUser(HttpServletRequest request, UserDetails user) {
        request.getSession().setAttribute("currentUser", user);
    }

    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
@RequestMapping(value = "cartView.htm", method = RequestMethod.POST)
    public ModelAndView Addcourse(@ModelAttribute Course O, @RequestParam(value = "image", required = false) MultipartFile image) {
    if (image != null && !image.isEmpty()) {
        try {
            byte[] imageBytes = image.getBytes();
            O.setImage(imageBytes);
        } catch (IOException e) {
            e.printStackTrace();
        }
    } else {
        // Set a default image
        byte[] defaultImage = getDefaultImage(); 
        O.setImage(defaultImage);
    }

        String sql = "INSERT into marks (reg, coursecode,coursename,title, marks, image) VALUES (?, ?, ?,?,?, ?)";

    this.jdbctemp.update(sql, O.getReg(),O.getCoursename(), O.getCoursecode(), O.getTitle(), O.getMarks(),O.getImage());

    return new ModelAndView("redirect:index.htm");
}

    private byte[] getDefaultImage() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
}
    
    




























