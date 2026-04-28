/*
 * Copyright 2010-2016 OpenXcom Developers.
 *
 * This file is part of OpenXcom.
 *
 * OpenXcom is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * OpenXcom is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with OpenXcom.  If not, see <http://www.gnu.org/licenses/>.
 */
#include <sstream>
#include "AllocateTrainingState.h"
#include "../Engine/Game.h"
#include "../Mod/Mod.h"
#include "../Engine/LocalizedText.h"
#include "../Interface/TextButton.h"
#include "../Interface/Window.h"
#include "../Interface/Text.h"
#include "../Savegame/SavedGame.h"
#include "../Savegame/Base.h"
#include "../Interface/TextList.h"
#include "../Savegame/Soldier.h"
#include "../Engine/Action.h"
#include "../Engine/Options.h"

namespace OpenXcom
{

/**
 * Initializes all the elements in the Training screen.
 * @param base Pointer to the base to handle.
 */
AllocateTrainingState::AllocateTrainingState(Base *base) : _sel(0)
{
	_base = base;
	_window = new Window(this, 320, 200, 0, 0);
	_txtTitle = new Text(300, 17, 10, 8);
	_txtRemaining = new Text(300, 10, 10, 24);
	_txtName = new Text(76, 10, 10, 40);
	_txtRank = new Text(68, 10, 100, 40);
	_txtFiring = new Text(45, 10, 166, 40);
	_txtReactions = new Text(55, 10, 208, 40);
	_txtTraining = new Text(48, 20, 270, 32);
	_btnOk = new TextButton(160, 14, 80, 174);
	_lstSoldiers = new TextList(290, 112, 8, 52);

	setInterface("allocatePsi");

	add(_window, "window", "allocatePsi");
	add(_btnOk, "button", "allocatePsi");
	add(_txtName, "text", "allocatePsi");
	add(_txtRank, "text", "allocatePsi");
	add(_txtFiring, "text", "allocatePsi");
	add(_txtReactions, "text", "allocatePsi");
	add(_txtTitle, "text", "allocatePsi");
	add(_txtRemaining, "text", "allocatePsi");
	add(_txtTraining, "text", "allocatePsi");
	add(_lstSoldiers, "list", "allocatePsi");

	centerAllSurfaces();

	_window->setBackground(_game->getMod()->getSurface("BACK01.SCR"));

	_btnOk->setText(tr("STR_OK"));
	_btnOk->onMouseClick((ActionHandler)&AllocateTrainingState::btnOkClick);
	_btnOk->onKeyboardPress((ActionHandler)&AllocateTrainingState::btnOkClick, Options::keyCancel);

	_txtTitle->setBig();
	_txtTitle->setAlign(ALIGN_CENTER);
	_txtTitle->setText(tr("STR_TRAINING"));

	_trainingSpace = base->getAvailableTraining() - base->getUsedTraining();
	_txtRemaining->setText(tr("STR_REMAINING_TRAINING_CAPACITY").arg(_trainingSpace));

	_txtName->setText(tr("STR_NAME"));
	_txtRank->setText(tr("STR_RANK"));
	_txtFiring->setText(tr("STR_FIRING"));
	_txtReactions->setText(tr("STR_REACTIONS"));
	_txtTraining->setText(tr("STR_IN_TRAINING"));

	_lstSoldiers->setColumns(5, 90, 60, 45, 55, 30);
	_lstSoldiers->setAlign(ALIGN_RIGHT, 2);
	_lstSoldiers->setAlign(ALIGN_RIGHT, 3);
	_lstSoldiers->setAlign(ALIGN_RIGHT, 4);
	_lstSoldiers->setSelectable(true);
	_lstSoldiers->setBackground(_window);
	_lstSoldiers->setMargin(2);
	_lstSoldiers->onMouseClick((ActionHandler)&AllocateTrainingState::lstSoldiersClick);

	int row = 0;
	for (std::vector<Soldier*>::const_iterator s = base->getSoldiers()->begin(); s != base->getSoldiers()->end(); ++s)
	{
		std::ostringstream firing;
		std::ostringstream reactions;
		_soldiers.push_back(*s);
		firing << (*s)->getCurrentStats()->firing;
		reactions << (*s)->getCurrentStats()->reactions;
		if ((*s)->isInTraining())
		{
			_lstSoldiers->addRow(5, (*s)->getName(true, 15).c_str(), tr((*s)->getRankString()).c_str(), firing.str().c_str(), reactions.str().c_str(), tr("STR_YES").c_str());
			_lstSoldiers->setRowColor(row, _lstSoldiers->getSecondaryColor());
		}
		else
		{
			_lstSoldiers->addRow(5, (*s)->getName(true, 15).c_str(), tr((*s)->getRankString()).c_str(), firing.str().c_str(), reactions.str().c_str(), tr("STR_NO").c_str());
			_lstSoldiers->setRowColor(row, _lstSoldiers->getColor());
		}
		row++;
	}
}

/**
 *
 */
AllocateTrainingState::~AllocateTrainingState()
{

}

/**
 * Returns to the previous screen.
 * @param action Pointer to an action.
 */
void AllocateTrainingState::btnOkClick(Action *)
{
	for (std::vector<Soldier*>::iterator i = _base->getSoldiers()->begin(); i != _base->getSoldiers()->end(); ++i)
	{
		(*i)->calcStatString(_game->getMod()->getStatStrings(), (Options::psiStrengthEval && _game->getSavedGame()->isResearched(_game->getMod()->getPsiRequirements())));
	}
	_game->popState();
}

/**
 * Assigns / removes a soldier from Training.
 * @param action Pointer to an action.
 */
void AllocateTrainingState::lstSoldiersClick(Action *action)
{
	_sel = _lstSoldiers->getSelectedRow();
	if (action->getDetails()->button.button == SDL_BUTTON_LEFT)
	{
		if (!_soldiers.at(_sel)->isInTraining())
		{
			if (_base->getUsedTraining() < _base->getAvailableTraining())
			{
				_lstSoldiers->setCellText(_sel, 4, tr("STR_YES"));
				_lstSoldiers->setRowColor(_sel, _lstSoldiers->getSecondaryColor());
				_trainingSpace--;
				_txtRemaining->setText(tr("STR_REMAINING_TRAINING_CAPACITY").arg(_trainingSpace));
				_soldiers.at(_sel)->setTraining(true);
			}
		}
		else
		{
			_lstSoldiers->setCellText(_sel, 4, tr("STR_NO"));
			_lstSoldiers->setRowColor(_sel, _lstSoldiers->getColor());
			_trainingSpace++;
			_txtRemaining->setText(tr("STR_REMAINING_TRAINING_CAPACITY").arg(_trainingSpace));
			_soldiers.at(_sel)->setTraining(false);
		}
	}
}

}
