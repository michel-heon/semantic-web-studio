/*
 * Copyright 2009-2021 Ping Identity Corporation
 * All Rights Reserved.
 */
/*
 * Copyright 2009-2021 Ping Identity Corporation
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *    http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
/*
 * Copyright (C) 2009-2021 Ping Identity Corporation
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License (GPLv2 only)
 * or the terms of the GNU Lesser General Public License (LGPLv2.1 only)
 * as published by the Free Software Foundation.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, see <http://www.gnu.org/licenses>.
 */
package com.unboundid.android.ldap.client;



import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.widget.TextView;

import com.unboundid.ldap.sdk.Entry;

import static com.unboundid.android.ldap.client.Logger.*;



/**
 * This class provides an Android activity that may be used to view the LDIF
 * representation of an entry.
 */
public final class ViewLDIF
       extends Activity
{
  /**
   * The name of the field used to hold the target entry.
   */
  public static final String BUNDLE_FIELD_ENTRY = "ENTRY";



  /**
   * The tag that will be used for log messages generated by this class.
   */
  private static final String LOG_TAG = "ViewLDIF";



  // The entry to be viewed.
  private volatile Entry entry = null;



  /**
   * Performs all necessary processing when this activity is created.
   *
   * @param  state  The state information for this activity.
   */
  @Override()
  protected void onCreate(final Bundle state)
  {
    logEnter(LOG_TAG, "onCreate", state);

    super.onCreate(state);

    final Intent i = getIntent();
    final Bundle extras = i.getExtras();
    restoreState(extras);
  }



  /**
   * Performs all necessary processing when this activity is started or resumed.
   */
  @Override()
  protected void onResume()
  {
    logEnter(LOG_TAG, "onResume");

    super.onResume();

    setContentView(R.layout.layout_view_ldif);
    setTitle(R.string.activity_label);

    // Populate the entry text.
    final TextView entryView =
         (TextView) findViewById(R.id.layout_view_ldif_text);
    entryView.setText(entry.toLDIFString(50));
  }



  /**
   * Performs all necessary processing when the instance state needs to be
   * saved.
   *
   * @param  state  The state information to be saved.
   */
  @Override()
  protected void onSaveInstanceState(final Bundle state)
  {
    logEnter(LOG_TAG, "onSaveInstanceState", state);

    saveState(state);
  }



  /**
   * Performs all necessary processing when the instance state needs to be
   * restored.
   *
   * @param  state  The state information to be restored.
   */
  @Override()
  protected void onRestoreInstanceState(final Bundle state)
  {
    logEnter(LOG_TAG, "onRestoreInstanceState", state);

    restoreState(state);
  }



  /**
   * Restores the state of this activity from the provided bundle.
   *
   * @param  state  The bundle containing the state information.
   */
  private void restoreState(final Bundle state)
  {
    logEnter(LOG_TAG, "restoreState", state);

    entry = (Entry) state.getSerializable(BUNDLE_FIELD_ENTRY);
  }



  /**
   * Saves the state of this activity to the provided bundle.
   *
   * @param  state  The bundle containing the state information.
   */
  private void saveState(final Bundle state)
  {
    logEnter(LOG_TAG, "saveState", state);

    state.putSerializable(BUNDLE_FIELD_ENTRY, entry);
  }
}