<%@ Page Title="" Language="C#" MasterPageFile="~/sample.Master" AutoEventWireup="true" CodeBehind="crud.aspx.cs" Inherits="sampleaspcrudn1.crud" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

   <div>
       <h2>User Form</h2>
       <table>
           <tr>
               <td>
                   <asp:Label ID="lblName" runat="server" Text="Name:" Width="100Px"></asp:Label>
               </td>
               <td>
                   <asp:TextBox ID="txtName" runat="server" Width="200px"></asp:TextBox>
                   <asp:RequiredFieldValidator ID="rfvName" runat="server" ControlToValidate="txtName" ErrorMessage="Name is required." ForeColor="Red"></asp:RequiredFieldValidator>
               </td>
           </tr>
           <tr>
               <td><asp:Label ID="lblDOB" runat="server" Text="Date of Birth:" Width="100Px"></asp:Label></td>
               <td>
                   <asp:TextBox ID="txtDOB" TextMode="Date" runat="server" Width="200Px"></asp:TextBox>
                   <asp:RequiredFieldValidator ID="reqDOB" runat="server" ControlToValidate="txtDOB" ErrorMessage="DOB is required." ForeColor="Red"></asp:RequiredFieldValidator>
               </td>
           </tr>
           <tr>
               <td><asp:Label ID="lblEmail" runat="server" Text="Email:" Width="100Px"></asp:Label></td>
               <td>
                   <asp:TextBox ID="txtEmail" runat="server" Width="200Px"></asp:TextBox>
                   <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="txtEmail" ErrorMessage="Email is required." ForeColor="Red"></asp:RequiredFieldValidator>
                   <asp:RegularExpressionValidator ID="revEmail" runat="server" ControlToValidate="txtEmail" ErrorMessage="Invalid Email format." ForeColor="Red" ValidationExpression="^\w+@[a-zA-Z_]+?\.[a-zA-Z]{2,3}$"></asp:RegularExpressionValidator>
               </td>
           </tr>
           <tr>
               <td><asp:Label ID="lblMobile" runat="server" Text="Mobile:" Width="100Px"></asp:Label></td>
               <td>
                   <asp:TextBox ID="txtMobile" runat="server" Width="200Px"></asp:TextBox>
                   <asp:RequiredFieldValidator ID="rfvMobile" runat="server" ControlToValidate="txtMobile" ErrorMessage="Mobile number is required." ForeColor="Red"></asp:RequiredFieldValidator>
                   <asp:RegularExpressionValidator ID="revMobile" runat="server" ControlToValidate="txtMobile" ErrorMessage="Invalid Mobile number." ForeColor="Red" ValidationExpression="^\d{10}$"></asp:RegularExpressionValidator>
               </td>
           </tr>
           <tr>
               <td><asp:Label ID="lblGender" runat="server" Text="Gender:" Width="100Px"></asp:Label></td>
               <td>
                   <asp:RadioButtonList  ID="rblGender" runat="server" TextAlign="Right" RepeatDirection="Horizontal">
                       <asp:ListItem Text="Male" Value="Male"></asp:ListItem>
                       <asp:ListItem Text="Female" Value="Female"></asp:ListItem>
                   </asp:RadioButtonList>
                   <asp:RequiredFieldValidator ID="rfvGender" runat="server" ControlToValidate="rblGender" ErrorMessage="Gender is required." InitialValue="" ForeColor="Red"></asp:RequiredFieldValidator>
               </td>
           </tr>
           <tr>
               <td><asp:Label ID="lblEducation" runat="server" Text="Education:" Width="100Px"></asp:Label></td>
               <td>
                   <asp:DropDownList ID="ddlEducation" runat="server" Width="200Px">
                       <asp:ListItem Text="Select" Value=""></asp:ListItem>
                       <asp:ListItem Text="High School" Value="High School"></asp:ListItem>
                       <asp:ListItem Text="Bachelor's" Value="Bachelor's"></asp:ListItem>
                       <asp:ListItem Text="Master's" Value="Master's"></asp:ListItem>
                       <asp:ListItem Text="PhD" Value="PhD"></asp:ListItem>
                   </asp:DropDownList>
                   <asp:RequiredFieldValidator ID="rfvEducation" runat="server" ControlToValidate="ddlEducation" ErrorMessage="Education is required." InitialValue="" ForeColor="Red"></asp:RequiredFieldValidator>
               </td>
           </tr>
           <tr>
               <td><asp:Label ID="lblExperience" runat="server" Text="Experience:" Width="100Px"></asp:Label></td>
               <td><asp:TextBox ID="txtExperience" runat="server" Width="200Px"></asp:TextBox></td>
           </tr>
           <tr>
               <td>
                   <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" />
                   <asp:Label ID="lblMessage" runat="server" ForeColor="Green"></asp:Label>
               </td>
           </tr>
       </table>
   </div>

   <asp:GridView ID="GridUser" Width="100%" ShowHeaderWhenEmpty="true" runat="server" AutoGenerateColumns="false" AllowPaging="true" PageSize="5" OnPageIndexChanging="GridUser_PageIndexChanging" Caption="<span style='color:Blue;text-decoration:underline;text-align:left;'><h3><i>User Details</i></h3></span>">
       <EmptyDataTemplate>
            <p style="color:red;">*No records found.</p>
       </EmptyDataTemplate>
           
       <Columns>
          <asp:TemplateField HeaderText="#">
                <ItemTemplate>
                    <%# Container.DataItemIndex+1 %>
                </ItemTemplate>
          </asp:TemplateField>

          <asp:TemplateField HeaderText="Sno" Visible="false">
                  <ItemTemplate>
                      <asp:Label ID="lblSno" runat="server" Text='<%# Eval("Id") %>'></asp:Label>
                  </ItemTemplate>
              </asp:TemplateField>

          <asp:TemplateField HeaderText="Name">
                  <ItemTemplate>
                      <asp:Label ID="lblName" runat="server" Text='<%# Eval("Name") %>'></asp:Label>
                  </ItemTemplate>
              </asp:TemplateField>

          <asp:TemplateField HeaderText="DOB">
                  <ItemTemplate>
                      <asp:Label ID="lblDOB" runat="server" Text='<%# Eval("DOB") %>' ></asp:Label>
                  </ItemTemplate>
          </asp:TemplateField>

          <asp:TemplateField HeaderText="Email">
              <ItemTemplate>
                  <asp:Label ID="lblEmail" runat="server" Text='<%# Eval("Email") %>'></asp:Label>
              </ItemTemplate>
          </asp:TemplateField>

          <asp:TemplateField HeaderText="Mobile No">
              <ItemTemplate>
                  <asp:Label ID="lblMobile" runat="server" Text='<%# Eval("Mobile") %>'></asp:Label>
              </ItemTemplate>
          </asp:TemplateField>

            <asp:TemplateField HeaderText="Gender ">
              <ItemTemplate>
                  <asp:Label ID="lblGender" runat="server" Text='<%# Eval("Gender") %>'></asp:Label>
              </ItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Education">
              <ItemTemplate>
                  <asp:Label ID="lblEducation" runat="server" Text='<%# Eval("Education") %>'></asp:Label>
              </ItemTemplate>
          </asp:TemplateField>

          <asp:TemplateField HeaderText="Experience">
              <ItemTemplate>
                  <asp:Label ID="lblExperience" runat="server" Text='<%# Eval("Experience") %>'></asp:Label>
              </ItemTemplate>
          </asp:TemplateField>

          <asp:TemplateField HeaderText="Action">
                <ItemTemplate>
                    <div class="text-center">
                        <asp:LinkButton ID="lbEdit" runat="server"   CausesValidation="false" CssClass="btn-small btn-primary" OnClick="lbEdit_Click" CommandName='<%# Eval("Id") %>'>
                            Edit
                        </asp:LinkButton>&nbsp;
                        <asp:LinkButton ID="lbRemove" runat="server" CausesValidation="false" CssClass="btn-small btn-danger" OnClick="lbRemove_Click" CommandName='<%# Eval("Id") %>'>
                            Delete
                        </asp:LinkButton>
                    </div>
                </ItemTemplate>
           </asp:TemplateField>
                             
      </Columns>
   </asp:GridView>

</asp:Content>
