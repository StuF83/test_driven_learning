class FlashcardsController < ApplicationController
  def index
    @flashcards = Flashcard.all
  end

  def show
    @flashcard = Flashcard.find(params[:id])
  end

  def new
    @flashcard = Flashcard.new
  end

  def create
    @flashcard = Flashcard.new(flashcard_params)

    if @flashcard.save
      redirect_to @flashcard
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @flashcard = Flashcard.find(params[:id])
  end

  def update
    @flashcard = Flashcard.find(params[:id])

    if @flashcard.update(flashcard_params)
      redirect_to @flashcard
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # private

  def flashcard_params
    params.expect(flashcard: [ :front, :back ])
  end
end
