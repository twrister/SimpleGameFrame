﻿Shader "Hidden/UIToneEffect"
{
    Properties
    {
        _MainTex ("Texture", 2D) = "white" {}
        _Factor ("Factor", Float) = 0
    }
    SubShader
    {
        Tags
        {
            "Queue" = "Transparent"
            "IgnoreProjector" = "True"
            "RenderType" = "Transparent"
            "PreviewType" = "Plane"
            "CanUseSpriteAtlas" = "True"
        }

        Cull Off
        Lighting Off
        ZWrite Off
        ZTest [unity_GUIZTestMode]
        Fog { Mode Off }
        Blend SrcAlpha OneMinusSrcAlpha

        Pass
        {

            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag

            #pragma multi_compile __ GRAYSCALE SEPIA NEGA PIXEL

            #include "UnityCG.cginc"
            #include "UIEffect.cginc"

            struct appdata
            {
                float4 vertex : POSITION;
                float2 uv : TEXCOORD0;
            };

            struct v2f
            {
                float2 uv : TEXCOORD0;
                float4 vertex : SV_POSITION;
            };

            v2f vert (appdata v)
            {
                v2f o;
                o.vertex = UnityObjectToClipPos(v.vertex);
                o.uv = v.uv;
                return o;
            }

            sampler2D _MainTex;
            fixed _Factor;
            float4 _MainTex_TexelSize;

            fixed4 frag (v2f i) : SV_Target
            {
                #if PIXEL
                half2 pixelSize = max(2, (1 - _Factor * 0.95) * _MainTex_TexelSize.zw);
                i.uv = round(i.uv * pixelSize) / pixelSize;
                #endif

                fixed4 col = tex2D(_MainTex, i.uv);

                col = ApplyToneEffect(col, _Factor);

                return col;
            }
            ENDCG
        }
    }
}
