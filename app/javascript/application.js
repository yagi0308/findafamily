// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import "./price";
import { Application } from "@hotwired/stimulus";
import FavoriteController from "./controllers/favorite_controller";

const application = Application.start();
application.register("favorite", FavoriteController);