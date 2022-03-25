using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;

 //DeleteCommand="DELETE FROM [table] WHERE [id] = @id" 
 //       InsertCommand="INSERT INTO [table] ([name], [address], [xender], [hobi], [food], [item], [foto]) VALUES (@name, @address, @xender, @hobi, @food, @item, @foto)" 
 //       ProviderName="<%$ ConnectionStrings:DatabaseConnectionString1.ProviderName %>" 
 //       SelectCommand="SELECT [id], [name], [address], [xender], [hobi], [food], [item], [foto] FROM [table]" 
 //       UpdateCommand="UPDATE [table] SET [name] = @name, [address] = @address, [xender] = @xender, [hobi] = @hobi, [food] = @food, [item] = @item, [foto] = @foto WHERE [id] = @id"
public partial class _Default : System.Web.UI.Page
{
    SqlConnection c = new SqlConnection(ConfigurationManager.ConnectionStrings["DatabaseConnectionString1"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        print();
    }
    public void print()
    {
        SqlDataAdapter a = new SqlDataAdapter("SELECT * FROM [table]",c);
        DataTable dt = new DataTable();
        a.Fill(dt);
        GridView1.DataSource = dt;
        GridView1.DataBind();
    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        Button btn = (Button)sender;
        SqlCommand s = new SqlCommand("DELETE FROM [table] WHERE [id] ="+btn.CommandArgument, c);
        c.Open();
        int abc = s.ExecuteNonQuery();
        if (abc == 1)
        {
            Response.Write("<script>alert('Data Deleted...')</script>");
            print();
            
        }
        else
        {
            Response.Write("<script>alert('Cannot Delete Data...')</script>");
            print();
           
        }
        c.Close();
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        clear();
        Button btn = (Button)sender;
        SqlDataAdapter a = new SqlDataAdapter("SELECT * FROM [table] WHERE [id]="+btn.CommandArgument, c);
        DataTable dt = new DataTable();
        a.Fill(dt);
        TextBox1.Text = dt.Rows[0][1].ToString();
        TextBox2.Text = dt.Rows[0][2].ToString();
        RadioButtonList1.SelectedValue = dt.Rows[0][3].ToString();
        DropDownList1.SelectedValue = dt.Rows[0][5].ToString();
        ListBox1.SelectedValue = dt.Rows[0][6].ToString();
        String demo = dt.Rows[0][4].ToString();
        String[] res = demo.Split(',');
        foreach (var i in res)
        {
            foreach (ListItem li in CheckBoxList1.Items)
            {
                if (i == li.ToString())
                {
                    li.Selected = true;
                }
            }
        }
        Image2.ImageUrl = "~/uploads/" + dt.Rows[0][7].ToString();
        ViewState["id"] = btn.CommandArgument;
        Button1.Text = "Update";
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (Button1.Text == "Update")
        {
            if (FileUpload1.HasFile)
            {
                string hobi = "";
                FileUpload1.SaveAs(Server.MapPath("~/uploads/" + FileUpload1.FileName));
                SqlCommand s = new SqlCommand("UPDATE [table] SET [name] = @name, [address] = @address, [xender] = @xender, [hobi] = @hobi, [food] = @food, [item] = @item, [foto] = @foto WHERE [id] = " + ViewState["id"], c);
                s.Parameters.AddWithValue("name", TextBox1.Text);
                s.Parameters.AddWithValue("address", TextBox2.Text);
                s.Parameters.AddWithValue("xender", RadioButtonList1.SelectedItem.ToString());
                foreach (ListItem li in CheckBoxList1.Items)
                {
                    if (li.Selected)
                    {
                        hobi += li.Text + ",";
                    }
                }
                s.Parameters.AddWithValue("hobi", hobi);
                s.Parameters.AddWithValue("food", DropDownList1.SelectedItem.ToString());
                s.Parameters.AddWithValue("item", ListBox1.SelectedItem.ToString());
                s.Parameters.AddWithValue("foto", FileUpload1.FileName);
                c.Open();
                int abc = s.ExecuteNonQuery();
                if (abc == 1)
                {
                    Response.Write("<script>alert('Data Updated...')</script>");
                    print();
                    clear();
                }
                else
                {
                    Response.Write("<script>alert('Cannot Update Data...')</script>");
                    print();
                    clear();
                }
                c.Close();
            }
            else
            {
                string hobi = "";
                SqlCommand s = new SqlCommand("UPDATE [table] SET [name] = @name, [address] = @address, [xender] = @xender, [hobi] = @hobi, [food] = @food, [item] = @item WHERE [id] = " + ViewState["id"], c);
                s.Parameters.AddWithValue("name", TextBox1.Text);
                s.Parameters.AddWithValue("address", TextBox2.Text);
                s.Parameters.AddWithValue("xender", RadioButtonList1.SelectedItem.ToString());
                foreach (ListItem li in CheckBoxList1.Items)
                {
                    if (li.Selected)
                    {
                        hobi += li.Text + ",";
                    }
                }
                s.Parameters.AddWithValue("hobi", hobi);
                s.Parameters.AddWithValue("food", DropDownList1.SelectedItem.ToString());
                s.Parameters.AddWithValue("item", ListBox1.SelectedItem.ToString());
                c.Open();
                int abc = s.ExecuteNonQuery();
                if (abc == 1)
                {
                    Response.Write("<script>alert('Data Updated...')</script>");
                    print();
                    clear();
                }
                else
                {
                    Response.Write("<script>alert('Cannot Update Data...')</script>");
                    print();
                    clear();
                }
                c.Close();  
            }
        }
        else
        {
            string hobi = "";
            FileUpload1.SaveAs(Server.MapPath("~/uploads/" + FileUpload1.FileName));
            SqlCommand s = new SqlCommand("INSERT INTO [table] ([name], [address], [xender], [hobi], [food], [item], [foto]) VALUES (@n, @a, @x, @h, @f, @i, @fo) ", c);
            s.Parameters.AddWithValue("n", TextBox1.Text);
            s.Parameters.AddWithValue("a", TextBox2.Text);
            s.Parameters.AddWithValue("x", RadioButtonList1.SelectedItem.ToString());
            foreach (ListItem li in CheckBoxList1.Items)
            {
                if (li.Selected)
                {
                    hobi += li.Text + ",";
                }
            }
            s.Parameters.AddWithValue("h", hobi);
            s.Parameters.AddWithValue("f", DropDownList1.SelectedItem.ToString());
            s.Parameters.AddWithValue("i", ListBox1.SelectedItem.ToString());
            s.Parameters.AddWithValue("fo", FileUpload1.FileName);
            c.Open();
            int abc = s.ExecuteNonQuery();
            if (abc == 1)
            {
                Response.Write("<script>alert('Data Inserted...')</script>");
                print();
                clear();
            }
            else
            {
                Response.Write("<script>alert('Cannot insert Data...')</script>");
                print();
                clear();
            }
            c.Close();
        }
        Button1.Text = "Insert";
    }
    public void clear()
    {
        TextBox1.Text = string.Empty;
        TextBox2.Text = string.Empty;
        RadioButtonList1.ClearSelection();
        DropDownList1.ClearSelection();
        ListBox1.ClearSelection();
        Image2.ImageUrl="";
        CheckBoxList1.ClearSelection();
    }
}