package com.example.Backend.service.impl;

import com.example.Backend.model.Recipe;
import com.example.Backend.model.Triage;
import com.example.Backend.repository.RecipeRepository;
import com.example.Backend.service.RecipeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class RecipeServiceImpl implements RecipeService {
    @Autowired
    RecipeRepository recipeRepository;

    @Override
    public Recipe createRecipe(Recipe recipe) {
        return recipeRepository.save(recipe);
    }

    @Override
    public void deleteRecipe(int id) {
        recipeRepository.deleteById(id);
    }

    @Override
    public List<Recipe> getAllRecipes() {
        return (List<Recipe>) recipeRepository.findAll();
    }

    @Override
    public Recipe getRecipe(int id) {
        return recipeRepository.findById(id).get();
    }

    @Override
    public boolean isRecipeExist(int id) {
        return recipeRepository.existsById(id);
    }

    @Override
    public boolean updateRecipe(int id, String recipeDetail) {
        Optional<Recipe> registrationOptional = recipeRepository.findById(id);
        if (registrationOptional.isPresent()) {
            Recipe recipe = registrationOptional.get();
            recipe.setId(id);
            recipe.setRecipeDetail(recipeDetail);

            recipeRepository.save(recipe);
            return true;
        }
        return false;
    }
}
