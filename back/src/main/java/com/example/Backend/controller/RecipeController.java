package com.example.Backend.controller;

import com.example.Backend.dto.RecipeDTO;
import com.example.Backend.dto.TriageDTO;
import com.example.Backend.exception.ValidationException;
import com.example.Backend.model.Consultation;
import com.example.Backend.model.Recipe;
import com.example.Backend.repository.RecipeRepository;
import com.example.Backend.service.RecipeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@CrossOrigin("*")
@RestController
@RequestMapping("/api/v1")
public class RecipeController {
    @Autowired
    private RecipeService recipeService;

    private final RecipeRepository recipeRepository;

    public RecipeController(RecipeRepository recipeRepository){
        this.recipeRepository=recipeRepository;
    }

    //EndPoint: http://localhost:8080/api/v1/workers
    //Method: GET
    @Transactional(readOnly = true)
    @CrossOrigin(origins = "http://localhost:4200")
    @GetMapping("/recipes")
    public ResponseEntity<List<Recipe>> getAllRecipes(){
        return new ResponseEntity<List<Recipe>>(recipeService.getAllRecipes(), HttpStatus.OK);
    }



    //EndPoint: http://localhost:8080/api/v1/workers
    //Method: GET
    //Saca la plaza mediante el id del worker
    @Transactional(readOnly = true)
    @CrossOrigin(origins = "http://localhost:4200")
    @GetMapping("/{id}/recipes")
    public ResponseEntity<Recipe> getRecipe(@PathVariable("id") int id){
        return new ResponseEntity<Recipe>(recipeService.getRecipe(id), HttpStatus.OK);
    }


    @Transactional
    @PostMapping("/recipes")
    @CrossOrigin(origins = "http://localhost:4200")
    public ResponseEntity<Recipe> createRecipe(@RequestBody Recipe recipe){

        return new ResponseEntity<>(recipeService.createRecipe(recipe), HttpStatus.CREATED);
    }

    //EndPoint: localhost:8080/api/v1/users/{id}
    //Method: DELETE
    @Transactional
    @DeleteMapping("/recipes/{id}")
    @CrossOrigin(origins = "http://localhost:4200")
    public ResponseEntity<Object> deleteRecipe(@PathVariable("id") int id){
        boolean isExist=recipeService.isRecipeExist(id);
        if(isExist){
            recipeService.deleteRecipe(id);
            return new ResponseEntity<>("Recipe is deleted successfully", HttpStatus.OK);
        }else{
            throw new ValidationException("Error deleting recipe");
        }
    }



    @Transactional
    @CrossOrigin(origins = "http://localhost:4200")
    @PutMapping("/recipes/{id}")
    public ResponseEntity<Object> updateRecipe(@PathVariable("id") int id, @RequestBody RecipeDTO updateDTO) {
        boolean updated = recipeService.updateRecipe(id,updateDTO.getRecipeDetail());
        if (updated) {
            return ResponseEntity.ok("Triage updated successfully");
        } else {
            return ResponseEntity.notFound().build();
        }
    }

}
