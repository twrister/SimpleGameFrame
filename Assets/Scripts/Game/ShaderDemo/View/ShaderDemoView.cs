﻿using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

namespace SthGame
{
    public class ShaderDemoView : UIBaseView
    {
        public Button closeBtn;
        public Text titleTxt;

        public GameObject uiElementParent;
        public GameObject uiElementTempParent;

        // menu
        public Button menuBtn_Tone;
        public Button menuBtn_Hue;
        public Button menuBtn_EdgeDetection;
        // tone
        public UIToneEffect tone_Effect;

        // hue
        public UIHSVModifier hue_Effect;

        // edge detection
        public UIEdgeDetection edgeDetection_Effect;
    }
}