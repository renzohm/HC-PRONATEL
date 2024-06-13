package com.example.Backend.service;

import com.example.Backend.model.Recipe;

import java.util.List;

public interface RecipeService {
    public abstract Recipe createRecipe(Recipe recipe);
    public abstract void deleteRecipe(int id);
    public abstract List<Recipe> getAllRecipes();

    public abstract Recipe getRecipe(int id);

    public abstract boolean isRecipeExist(int id);

    public abstract boolean updateRecipe(int id,String recipeDetail);
}
