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
        public Button menuBtn_Blur;
        public Button menuBtn_Flip;
        public Button menuBtn_Shiny;
        public Button menuBtn_Transform;

        public UIToneEffect tone_Effect;
        public UIHSVModifier hue_Effect;
        public UIEdgeDetection edgeDetection_Effect;
        public UIBlur blur_Effect;
        public UIFlip flip_Effect;
        public UIShiny shiny_Effect;
        public UITransform transform_Effect;
    }
}