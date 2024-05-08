using System.Collections;
using System.Collections.Generic;
using System.Security.Cryptography;
using UnityEngine;


public class BallScript : MonoBehaviour
{
    void Start()
    {

    }

    void Update()
    {
        if (Input.GetKeyDown(KeyCode.R))
        {
            Init();
        }
    }


    public void Init()
    {
        this.gameObject.transform.position = new Vector3(0, 2.2f, 0);
    }


    private void OnCollisionEnter(Collision collision)
    {
        BallAnim();
    }

    public int BallDepth()
    {
        if (this.transform.position.y > -10)
            return 1;

        else if (this.transform.position.y > -20)
            return 2;

        else if (this.transform.position.y > -30)
            return 3;
        else
            return 4;                
    }
    public void BallAnim()
    {
        this.gameObject.GetComponent<Animator>().SetInteger("Depth", BallDepth());
    }

    public void ScalingBall()
    {
        this.gameObject.GetComponent<Animator>().SetTrigger("Start");
    }

}
