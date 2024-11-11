class GreetingsController < ApplicationController
  def index
    @greetings = {
      english: english_greeting,
      spanish: spanish_greeting,
      french: french,
      german: german
    }
  end

  private

  def english_greeting
    "Hello, It's me!"
  end

  def spanish_greeting
    "Hola, soy yo!"
  end

  def french
    "Bonjour, c'est moi!"
  end

  def german
    "Hallo, ich bin es!"
  end
end
